package site.hclub.hyndai.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import site.hclub.hyndai.common.response.ApiResponse;
import site.hclub.hyndai.common.response.SuccessType;
import site.hclub.hyndai.dto.response.ClubLikeResponse;
import site.hclub.hyndai.service.club.ClubLikeService;

import java.util.List;

@RestController
@RequestMapping("/club")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubLikeController {
    private final ClubLikeService clubLikeService;

    //TODO 추후에 memberNo pathvariable이 아닌 auth로 받아오는 방식으로 변경
    @PostMapping("/{clubNo}/like/{memberNo}")
    public ResponseEntity<ApiResponse<Object>> saveLike(@PathVariable Long clubNo,
                                                        @PathVariable Long memberNo){
        clubLikeService.save(clubNo, memberNo);
        return ApiResponse.success(SuccessType.CREATE_LIKE_SUCCESS);
    }

    @DeleteMapping("/{clubNo}/like/{memberNo}")
    public ResponseEntity<ApiResponse<Object>> deleteLike(@PathVariable Long clubNo,
                                                          @PathVariable Long memberNo){
        clubLikeService.delete(clubNo, memberNo);
        return ApiResponse.success(SuccessType.DELETE_LIKE_SUCCESS);
    }

    @GetMapping("/like")
    public ResponseEntity<ApiResponse<List<ClubLikeResponse>>> deleteLike(){
       return ApiResponse.success(SuccessType.GET_CLUB_ORDER_BY_LIKE , clubLikeService.findAllOrderByLike());
    }

}
