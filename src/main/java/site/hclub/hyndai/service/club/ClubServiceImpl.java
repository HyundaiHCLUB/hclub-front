package site.hclub.hyndai.service.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.domain.club.ClubNotice;
import site.hclub.hyndai.dto.request.ClubRequest;
import site.hclub.hyndai.dto.request.ClubUpdateRequest;
import site.hclub.hyndai.dto.request.MemberClubCreateRequest;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;
import site.hclub.hyndai.dto.response.ApplyResponse;
import site.hclub.hyndai.dto.response.ClubUpdateReponse;
import site.hclub.hyndai.repository.club.ClubRepository;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubServiceImpl implements ClubService{

    private final ClubRepository clubRepository;

    public Club save(MultipartFile image, ClubRequest clubRequest) {
        return clubRepository.save(image, clubRequest);

    }

    public ApplyResponse apply(MemberClubCreateRequest memberClubCreateRequest){
        return clubRepository.apply(memberClubCreateRequest);
    }

    public List<Club> findAllByCategoryId(Long categoryId) {
        return clubRepository.findAllByCategoryId(categoryId);
    }

    public List<Club> findAllByKeyword(String keyword) {
        return clubRepository.findAllByKeyword(keyword);
    }

    public List<Club> findAll() {
        return clubRepository.findAll();
    }

    public ClubUpdateReponse update(Long clubNo, ClubUpdateRequest clubUpdateRequest, MultipartFile image) {
        return clubRepository.update(clubNo, clubUpdateRequest, image);
    }

    public void delete(Long clubNo) {
        clubRepository.delete(clubNo);
    }
}
