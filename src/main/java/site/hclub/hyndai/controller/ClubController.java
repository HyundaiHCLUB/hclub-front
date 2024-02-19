package site.hclub.hyndai.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import site.hclub.hyndai.common.response.ApiResponse;
import site.hclub.hyndai.common.response.SuccessType;
import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.dto.request.ClubRequest;
import site.hclub.hyndai.dto.request.ClubUpdateRequest;
import site.hclub.hyndai.dto.request.MemberClubCreateRequest;
import site.hclub.hyndai.dto.response.ApplyResponse;
import site.hclub.hyndai.dto.response.ClubUpdateReponse;
import site.hclub.hyndai.service.club.ClubService;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/club")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubController {

    private final ClubService clubService;
    @GetMapping(value = "/main")
    public ModelAndView home(Locale locale, Model model) {
        log.info("Welcome home! The client locale is {}.", locale);
    ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("home/home");
        model.addAttribute("serverTime", formattedDate );

        return mav;
    }
    @PostMapping(consumes = {MediaType.APPLICATION_JSON_VALUE,
            MediaType.MULTIPART_FORM_DATA_VALUE}, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ApiResponse<Club>> saveClub(@RequestPart MultipartFile image,
                                                      @RequestPart(value = "request") ClubRequest request){
        return ApiResponse.success(SuccessType.CREATE_CLUB_SUCCESS, clubService.save(image, request));
    }

    @GetMapping("/{categoryId}")
    public ResponseEntity<ApiResponse<List<Club>>> getClubByCategory(@PathVariable(required = false) Long categoryId){
        if(categoryId != null)
            return ApiResponse.success(SuccessType.GET_CLUB_BY_CATEGORY_SUCCESS, clubService.findAllByCategoryId(categoryId));
        return ApiResponse.success(SuccessType.GET_CLUB_LIST_SUCCESS, clubService.findAll());
    }

    @PostMapping(value = "/{clubNo}", consumes = {MediaType.APPLICATION_JSON_VALUE,
                    MediaType.MULTIPART_FORM_DATA_VALUE}, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ApiResponse<ClubUpdateReponse>> updateClub(@PathVariable Long clubNo,
                                                                     @RequestPart MultipartFile image,
                                                                     @RequestPart(value = "request") ClubUpdateRequest request){
        return ApiResponse.success(SuccessType.UPDATE_CLUB_SUCCESS, clubService.update(clubNo, request, image));
    }

    @DeleteMapping("/{clubNo}")
    public ResponseEntity<ApiResponse<Object>> deleteClub(@PathVariable Long clubNo){
        clubService.delete(clubNo);
        return ApiResponse.success(SuccessType.DELETE_CLUB_SUCCESS);
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<Club>>> getClubByKeyword(@RequestParam("keyword") String keyword){
        return ApiResponse.success(SuccessType.SEARCH_CLUB_SUCCESS,
                clubService.findAllByKeyword(keyword));
    }

    @PostMapping("/{clubNo}/apply")
    public ResponseEntity<ApiResponse<ApplyResponse>> applyClub(@PathVariable Long clubNo,
                                                                @RequestBody MemberClubCreateRequest request){
        return ApiResponse.success(SuccessType.APPLY_CLUB_SUCCESS, clubService.apply(request));
    }

}
