package site.hclub.hyndai.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ViewController {
    @GetMapping(value = "main")
    public ModelAndView home(Locale locale, Model model) {
        log.info("Welcome home! The client locale is {}.", locale);
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("home/home");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }

    @GetMapping(value = "comp")
    public ModelAndView compMain(Locale locale, Model model) {
        log.info("Welcome home! The client locale is {}.", locale);
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("comp/compMain");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }
    /* 매칭 상세페이지로 이동 */
    @GetMapping("comp/matchDetail")
    public ModelAndView goMatchDetailPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/MatchDetail");
        return mav;
    }
    /* 경기 기록 페이지로 이동*/
    @GetMapping("comp/matchRecord")
    public ModelAndView goMatchRecordPage(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("comp/matchRecord");
        return mav;
    }
    /* 메인페이지 - 오늘의 TOP10 랭킹 페이지로 이동 */
    @GetMapping("home/todayRanking")
    public ModelAndView goTodayRanking(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("home/todayRanking");
        return mav;
    }
    /****** 마이페이지 뷰 이동 ******/
    /* 마이페이지로 이동 */
    @GetMapping("mypage")
    public ModelAndView goMyPage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/mypageMain");
        return mav;
    }
    /* 회원정보 수정페이지로 이동*/
    @GetMapping("mypage/updateProfileView")
    public ModelAndView goUpdateProfileView(){
        return new ModelAndView("mypage/updateProfile");
    }
    /* 마이페이지 - 매치 히스토리 페이지로 이동*/
    @GetMapping("mypage/myMatchHistoryView")
    public ModelAndView goMyMatchHistory(){
        return new ModelAndView("mypage/myMatchHistory");
    }
    /***** end mypage *****/
}
