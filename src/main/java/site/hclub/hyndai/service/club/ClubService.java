package site.hclub.hyndai.service.club;

import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.domain.club.ClubNotice;
import site.hclub.hyndai.dto.request.ClubRequest;
import site.hclub.hyndai.dto.request.ClubUpdateRequest;
import site.hclub.hyndai.dto.request.MemberClubCreateRequest;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;
import site.hclub.hyndai.dto.response.ApplyResponse;
import site.hclub.hyndai.dto.response.ClubUpdateReponse;

import java.util.List;


public interface ClubService {
    Club save(MultipartFile image, ClubRequest clubRequest);
    ApplyResponse apply(MemberClubCreateRequest memberClubCreateRequest);
    List<Club> findAllByCategoryId(Long categoryId);
    List<Club> findAllByKeyword(String keyword);
    List<Club> findAll();
    ClubUpdateReponse update(Long clubNo, ClubUpdateRequest clubUpdateRequest, MultipartFile image);
    void delete(Long clubNo);

}
