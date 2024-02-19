package site.hclub.hyndai.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.common.response.ApiResponse;
import site.hclub.hyndai.common.response.SuccessType;
import java.util.List;
import site.hclub.hyndai.dto.request.HistoryCreateRequest;
import site.hclub.hyndai.dto.response.ClubHistoryGetResponse;
import site.hclub.hyndai.dto.response.ClubHistoryResponse;
import site.hclub.hyndai.service.club.ClubHistoryService;

import static site.hclub.hyndai.common.response.SuccessType.DELETE_CLUB_HISTORY_SUCCESS;
import static site.hclub.hyndai.common.response.SuccessType.GET_CLUB_HISTORY_SUCCESS;

@RestController
@RequestMapping("/club")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubHistoryController {
    private final ClubHistoryService clubHistoryService;

    @PostMapping(value = "/{clubNo}/history",consumes = {MediaType.APPLICATION_JSON_VALUE,
            MediaType.MULTIPART_FORM_DATA_VALUE}, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ApiResponse<ClubHistoryResponse>> saveClubHistory(@PathVariable Long clubNo,
                                                                     @RequestPart List<MultipartFile> image,
                                                                     @RequestPart(value = "request") HistoryCreateRequest request){
        return ApiResponse.success(SuccessType.CREATE_CLUB_HISTORY_SUCCESS, clubHistoryService.save(clubNo, image, request));

    }

    @GetMapping("/{clubNo}/history")
    public ResponseEntity<ApiResponse<List<ClubHistoryGetResponse>>> getClubHistory(@PathVariable Long clubNo){
        return ApiResponse.success(GET_CLUB_HISTORY_SUCCESS, clubHistoryService.findAll(clubNo));
    }

    @DeleteMapping("/{clubNo}/history")
    public ResponseEntity<ApiResponse<Object>> deleteClubHistory(@PathVariable Long clubNo){
        clubHistoryService.delete(clubNo);
        return ApiResponse.success(DELETE_CLUB_HISTORY_SUCCESS);
    }
}
