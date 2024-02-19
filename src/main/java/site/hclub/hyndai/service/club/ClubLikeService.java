package site.hclub.hyndai.service.club;

import site.hclub.hyndai.dto.response.ClubLikeResponse;

import java.util.List;

public interface ClubLikeService {
    void save(Long clubNo, Long memberNo);
    void delete(Long clubNo, Long memberNo);

    List<ClubLikeResponse> findAllOrderByLike();
}
