package site.hclub.hyndai.service.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.dto.request.HistoryCreateRequest;
import site.hclub.hyndai.dto.response.ClubHistoryGetResponse;
import site.hclub.hyndai.dto.response.ClubHistoryResponse;
import site.hclub.hyndai.repository.club.ClubHistoryRepository;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubHistoryServiceImpl implements ClubHistoryService{

    private final ClubHistoryRepository clubHistoryRepository;

    public ClubHistoryResponse save(Long clubNo, List<MultipartFile> image, HistoryCreateRequest historyCreateRequest) {
        return clubHistoryRepository.save(clubNo, image, historyCreateRequest);
    }

    public List<ClubHistoryGetResponse> findAll(Long clubNo) {
        return clubHistoryRepository.findAll(clubNo);
    }

    public void delete(Long clubNo) {
        clubHistoryRepository.delete(clubNo);
    }
}
