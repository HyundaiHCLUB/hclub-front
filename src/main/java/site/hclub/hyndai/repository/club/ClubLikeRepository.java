package site.hclub.hyndai.repository.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import site.hclub.hyndai.domain.club.ClubLike;
import site.hclub.hyndai.dto.request.LikeRequest;
import site.hclub.hyndai.dto.response.ClubLikeResponse;
import site.hclub.hyndai.exception.ClubLikeException;
import site.hclub.hyndai.mapper.club.ClubLikeMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static site.hclub.hyndai.exception.ClubLikeExceptionType.ALREADY_EXIST_LIKE;
import static site.hclub.hyndai.exception.ClubLikeExceptionType.NOT_IS_LIKED;

@Slf4j
@Repository
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubLikeRepository {
    private final ClubLikeMapper clubLikeMapper;

    public void save(Long clubNo, Long memberNo) {
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("clubNo", clubNo);
        parameterMap.put("memberNo", memberNo);
        Optional<ClubLike> clubLike = clubLikeMapper.findLike(parameterMap);

        if(clubLike.stream().count() != 0)
            throw new ClubLikeException(ALREADY_EXIST_LIKE);

        LikeRequest likeRequest = LikeRequest.builder()
                .isLiked("Y")
                .clubNo(clubNo)
                .memberNo(memberNo)
                .build();
        clubLikeMapper.saveLike(likeRequest);
    }

    public void delete(Long clubNo, Long memberNo) {
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("clubNo", clubNo);
        parameterMap.put("memberNo", memberNo);
        clubLikeMapper.findLike(parameterMap)
                .orElseThrow(()-> new ClubLikeException(NOT_IS_LIKED));

        clubLikeMapper.deleteLike(parameterMap);
    }

    public List<ClubLikeResponse> findAllOrderByLike(){
        return clubLikeMapper.findAllOrderByLike();
    }

}
