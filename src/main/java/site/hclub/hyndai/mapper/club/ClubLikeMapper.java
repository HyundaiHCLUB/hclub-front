package site.hclub.hyndai.mapper.club;

import site.hclub.hyndai.domain.club.ClubLike;
import site.hclub.hyndai.dto.request.LikeRequest;
import site.hclub.hyndai.dto.response.ClubLikeResponse;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ClubLikeMapper {
    Optional<ClubLike> findLike(Map<String, Object> parameterMap);
    void saveLike(LikeRequest likeRequest);
    void deleteLike(Map<String, Object> parameterMap);

    List<ClubLikeResponse> findAllOrderByLike();
}
