package site.hclub.hyndai.repository.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.common.util.AmazonS3Service;
import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.domain.club.MemberClub;
import site.hclub.hyndai.dto.request.*;
import site.hclub.hyndai.dto.response.ApplyResponse;
import site.hclub.hyndai.dto.response.ClubUpdateReponse;
import site.hclub.hyndai.exception.ClubException;
import site.hclub.hyndai.mapper.club.ClubMapper;

import java.io.IOException;
import java.util.List;

import static site.hclub.hyndai.exception.ClubExceptionType.INVALID_CLUB;


@Slf4j
@Repository
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubRepository {
    private final ClubMapper clubMapper;
    private final AmazonS3Service s3Service;

    public Club save(MultipartFile image, ClubRequest clubRequest){
        //멤버가 없는 경우
        //없는 카테고리를 선택하는 경우

        String imageUrl = "";
        try {
            imageUrl = s3Service.uploadImage("club",image);
        } catch (RuntimeException | IOException e) {
            throw new RuntimeException(e.getMessage());
        }

        ClubCreateRequest clubCreateRequest = ClubCreateRequest.builder()
                .clubLoc(clubRequest.getClubLoc())
                .clubInfo(clubRequest.getClubInfo())
                .clubName(clubRequest.getClubName())
                .clubImage(imageUrl)
                .categoryId(clubRequest.getCategoryId())
                .build();

        Club club = Club.builder()
                        .clubCreateRequest(clubCreateRequest)
                        .build();
        clubMapper.save(club);
        log.info("동아리id="+club.getClubNo());

        MemberClubCreateRequest memberClubCreateRequest = MemberClubCreateRequest.builder()
                .clubNo(club.getClubNo())
                .memberNo(clubRequest.getMemberNo())
                .creatorYn(clubRequest.getCreatorYn())
                .build();

        MemberClub memberClub = MemberClub.builder()
                .memberClubCreateRequest(memberClubCreateRequest)
                .build();
        clubMapper.saveMember(memberClub);

        return club;
    }

    public ApplyResponse apply(MemberClubCreateRequest memberClubCreateRequest){
        getClubById(memberClubCreateRequest.getClubNo());

        log.info("멤버id="+memberClubCreateRequest.getMemberNo());
        MemberClub memberClub = MemberClub.builder()
                .memberClubCreateRequest(memberClubCreateRequest)
                .build();

        clubMapper.saveMember(memberClub);

        ApplyResponse applyResponse = ApplyResponse.builder()
                .clubNo(memberClubCreateRequest.getClubNo())
                .memberNo(memberClubCreateRequest.getMemberNo())
                .creatorYn(memberClubCreateRequest.getCreatorYn())
                .build();
        return applyResponse;
    }


    public List<Club> findAllByCategoryId(Long categoryId){
        return clubMapper.findAllByCategoryId(categoryId);
    }

    public List<Club> findAll(){
        return clubMapper.findAll();
    }

    public ClubUpdateReponse update(Long clubNo, ClubUpdateRequest clubUpdateRequest, MultipartFile image){
        Club club = getClubById(clubNo);
        updateClubImage(club, clubUpdateRequest, image);
        clubMapper.update(clubUpdateRequest);

        return new ClubUpdateReponse(clubUpdateRequest.getClubName(), clubUpdateRequest.getClubImage(),
                clubUpdateRequest.getClubInfo(),clubUpdateRequest.getClubLoc(),clubUpdateRequest.getCategoryId());
    }

    private Club getClubById(Long clubNo) {
        return clubMapper.findById(clubNo)
                .orElseThrow(() -> new ClubException(INVALID_CLUB));
    }

    private void updateClubImage(Club club, ClubUpdateRequest clubUpdateRequest, MultipartFile image) {
        String originalImage = club.getClubImage();

        if (image != null) {
            String imageUrl = "";
            try {
                if (originalImage != null) {
                    s3Service.deleteImage(originalImage);
                }
                imageUrl = s3Service.uploadImage("club", image);
            } catch (RuntimeException | IOException e) {
                throw new RuntimeException(e.getMessage());
            }
            clubUpdateRequest.setClubImage(imageUrl);
        } else {
            clubUpdateRequest.setClubImage(originalImage);
        }
    }

    public void delete(Long clubNo){
        getClubById(clubNo);
        clubMapper.delete(clubNo);
    }

    public List<Club> findAllByKeyword(String keyword){
        return clubMapper.findAllByKeyword(keyword);
    }

}
