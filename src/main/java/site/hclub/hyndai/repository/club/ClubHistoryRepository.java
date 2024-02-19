package site.hclub.hyndai.repository.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.common.util.AmazonS3Service;
import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.domain.club.ClubHistory;
import site.hclub.hyndai.dto.request.HistoryCreateRequest;
import site.hclub.hyndai.dto.response.ClubHistoryGetResponse;
import site.hclub.hyndai.dto.response.ClubHistoryResponse;
import site.hclub.hyndai.exception.ClubException;
import site.hclub.hyndai.mapper.club.ClubHistoryMapper;
import site.hclub.hyndai.mapper.club.ClubMapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static site.hclub.hyndai.exception.ClubExceptionType.INVALID_CLUB;

@Slf4j
@Repository
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubHistoryRepository {
    private final ClubHistoryMapper clubHistoryMapper;
    private final ClubMapper clubMapper;
    private final AmazonS3Service s3Service;
    public ClubHistoryResponse save(Long clubNo, List<MultipartFile> image, HistoryCreateRequest historyCreateRequest){
        List<String> imageUrls = null;
        try {
            imageUrls = s3Service.uploadImages("club", image);
        } catch (RuntimeException | IOException e) {
            throw new RuntimeException(e.getMessage());
        }

        ClubHistory clubHistory = ClubHistory
                .builder()
                .clubNo(clubNo)
                .title(historyCreateRequest.getTitle())
                .build();

        clubHistoryMapper.saveTitle(clubHistory);
        log.info("동아리 기록id="+clubHistory.getHistoryNo());
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("historyNo", clubHistory.getHistoryNo());
        parameterMap.put("imageUrls", imageUrls);
        clubHistoryMapper.saveImage(parameterMap);

        ClubHistoryResponse response = ClubHistoryResponse.builder()
                .historyNo(clubHistory.getClubNo())
                .imageUrl(imageUrls)
                .title(historyCreateRequest.getTitle())
                .clubNo(clubNo)
                .build();

        return response;
    }

    public List<ClubHistoryGetResponse> findAll(Long clubNo){
        getClubById(clubNo); //TODO 이미지 업로드 안하는 경우?
        return clubHistoryMapper.findAll(clubNo);
    }

    public void delete(Long clubNo){
        getClubById(clubNo);
        clubHistoryMapper.deleteImage(clubNo);
        clubHistoryMapper.deleteTitle(clubNo);
    }

    private Club getClubById(Long clubNo) {
        return clubMapper.findById(clubNo)
                .orElseThrow(() -> new ClubException(INVALID_CLUB));
    }
}
