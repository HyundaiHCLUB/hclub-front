package site.hclub.hyndai.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import site.hclub.hyndai.common.response.ApiResponse;
import site.hclub.hyndai.domain.club.ClubNotice;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;
import site.hclub.hyndai.service.club.ClubNoticeService;

import java.util.List;

import static site.hclub.hyndai.common.response.SuccessType.*;

@RestController
@RequestMapping("/club")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubNoticeController {
    private final ClubNoticeService clubNoticeService;

    @PostMapping("/notice")
    public ResponseEntity<ApiResponse<ClubNotice>> updateClub(@RequestBody NoticeCreateRequest request){
        return ApiResponse.success(CREATE_CLUB_NOTICE_SUCCESS, clubNoticeService.save(request));
    }

    @GetMapping("/{clubNo}/notice")
    public ResponseEntity<ApiResponse<List<ClubNotice>>> getClubNotices(@PathVariable Long clubNo){
        return ApiResponse.success(GET_CLUB_NOTICE_SUCCESS, clubNoticeService.findAll(clubNo));
    }

    @GetMapping("/{clubNo}/notice/{noticeNo}")
    public ResponseEntity<ApiResponse<ClubNotice>> getClubNotice(@PathVariable Long clubNo,
                                                                 @PathVariable Long noticeNo){
        return ApiResponse.success(GET_CLUB_DETAIL_NOTICE_SUCCESS, clubNoticeService.findById(noticeNo));
    }

}
