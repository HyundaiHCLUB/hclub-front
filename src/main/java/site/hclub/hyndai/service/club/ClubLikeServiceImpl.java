package site.hclub.hyndai.service.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.hclub.hyndai.dto.response.ClubLikeResponse;
import site.hclub.hyndai.repository.club.ClubLikeRepository;

import java.util.List;


@Slf4j
@Service
@Transactional
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubLikeServiceImpl implements ClubLikeService{

    private final ClubLikeRepository clubLikeRepository;

    public void save(Long clubNo, Long memberNo) {
        clubLikeRepository.save(clubNo, memberNo);
    }

    public void delete(Long clubNo, Long memberNo) {
        clubLikeRepository.delete(clubNo, memberNo);
    }

    public List<ClubLikeResponse> findAllOrderByLike() {
        return clubLikeRepository.findAllOrderByLike();
    }
}
