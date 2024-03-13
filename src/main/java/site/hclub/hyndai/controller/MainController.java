package site.hclub.hyndai.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class MainController {
    @GetMapping()
    public ModelAndView home(Locale locale, Model model) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("home/home");
        return mav;
    }


    /* 메인페이지 - 오늘의 TOP10 랭킹 페이지로 이동 */
    @GetMapping("home/todayRanking")
    public ModelAndView goTodayRanking() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("home/todayRanking");
        return mav;
    }


    /****** 마이페이지 뷰 이동 ******/
    /* 마이페이지로 이동 */
    @GetMapping("mypage")
    public ModelAndView goMyPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/mypageMain");
        return mav;
    }

    /* 회원정보 수정페이지로 이동*/
    @GetMapping("mypage/updateProfileView")
    public ModelAndView goUpdateProfileView() {
        return new ModelAndView("mypage/updateProfile");
    }

    /* 마이페이지 - 매치 히스토리 페이지로 이동*/
    @GetMapping("mypage/myMatchHistoryView")
    public ModelAndView goMyMatchHistory() {
        return new ModelAndView("mypage/myMatchHistory");
    }

    /* 마이페이지 - 내 동아리 */
    @GetMapping("/mypage/myClubs")
    public ModelAndView goMyClubsView() {
        return new ModelAndView("mypage/myClubs");
    }

    /* 마이페이지 - 받은 선물함 */
    @GetMapping("mypage/myGifts")
    public ModelAndView goMyGiftsView() {
        return new ModelAndView("mypage/myPageGifts");
    }

    /* 마이페이지 - 즐겨찾기 */
    @GetMapping("mypage/myFavorites")
    public ModelAndView goMyFavoritesView() {
        return new ModelAndView("mypage/myFavorites");
    }

    /* 마이페이지 - 진행중인 매치 */
    @GetMapping("mypage/myProceedingMatch")
    public ModelAndView goMyProceedingMatchView() {
        return new ModelAndView("mypage/myProceedingMatch");
    }

    /* 마이페이지 -> 매치 히스토리 -> 상세정보 */
    @GetMapping("mypage/myMatchHistory/detail/{matchHistoryNo}")
    public ModelAndView goMyMatchHistoryDetailView(@PathVariable("matchHistoryNo") Long matchHistoryNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("matchHistoryNo", matchHistoryNo);
        mav.setViewName("mypage/myMatchHistoryDetail");
        return mav;
    }

    ;

    /***** end mypage *****/
    /* 로그인 페이지 이동*/
    @GetMapping("login/loginView")
    public ModelAndView goLoginView() {
        return new ModelAndView("auth/loginView");
    }

    /* 회원가입 첫번째 페이지 이동*/
    @GetMapping("login/registerViewFrst")
    public ModelAndView goRegisterFrstView() {
        return new ModelAndView("auth/registerViewFrst");
    }

    /* 회원가입 두번째 페이지 이동*/
    @GetMapping("login/registerViewScnd")
    public ModelAndView goRegisterScndView() {
        return new ModelAndView("auth/registerViewScnd");
    }

    @GetMapping(value = "/home/hot")
    public ModelAndView getHotClub(Model model) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("home/hotClub");

        return mav;
    }

    /* 회원가입 두번째 페이지 이동*/
    @GetMapping(value = "/home/district")
    public ModelAndView getClubDistrict(Model model) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("home/clubDistrict");

        return mav;
    }
    /* 동아리 관리페이지 이동*/
    @GetMapping("dashboard/clubAdminPage")
    public ModelAndView clubAdminPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/adminView/clubAdminPage");

        return mv;
    }
    /* 개인랭킹조회 관리페이지 이동*/
    @GetMapping("dashboard/rankAdminPage")
    public ModelAndView rankAdminPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/adminView/rankAdminPage");

        return mv;
    }
    /* 관리자 로그인 페이지 이동*/
    @GetMapping("dashboard/adminLoginPage")
    public ModelAndView loginPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/adminView/adminLoginPage");

        return mv;
    }
    /* 관리자 확인 모달*/
    @GetMapping("dashboard/confirmModal")
    public ModelAndView modal() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common/confirmModal");

        return mv;
    }
}
