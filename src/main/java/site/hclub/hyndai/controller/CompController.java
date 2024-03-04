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

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/competition")
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class CompController {

    @GetMapping()
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

    @GetMapping("/create/1")
    public ModelAndView createTeamOne(Locale locale, Model model) {
        log.info("Create Team", locale);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/createTeamOne");

        return mav;
    }

    @GetMapping("/create/2")
    public ModelAndView createTeamTwo(Locale locale, Model model) {
        log.info("Create Team", locale);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/createTeamTwo");

        return mav;
    }

    @GetMapping("/create/3")
    public ModelAndView createTeamThree() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/createTeamThree");
        return mav;
    }

    @GetMapping("/create/4")
    public ModelAndView createTeamFour() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/createTeamFour");
        return mav;
    }

    @GetMapping("/start")
    public ModelAndView goMatchStart() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/matchStart");
        return mav;
    }

    @GetMapping("/waiting")
    public ModelAndView watingPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/matchWaiting");
        return mav;
    }

    @GetMapping("/success/{matchHistoryNo}")
    public ModelAndView successPage(Model model, @PathVariable Long matchHistoryNo) {
        ModelAndView mav = new ModelAndView();
        model.addAttribute("matchHistoryNo", matchHistoryNo);

        mav.setViewName("comp/matchSuccess");
        return mav;
    }

    /* 매칭 상세페이지로 이동 */
    @GetMapping("/matchDetail/{matchHistoryNo}")
    public ModelAndView goMatchDetailPage(@PathVariable("matchHistoryNo") Long matchHistoryNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("matchHistoryNo", matchHistoryNo);
        mav.setViewName("comp/MatchDetail");
        return mav;
    }

    /* 팀 상세정보 페이지로 이동 (경기 상세정보 -> [상세정보] 클릭 */
    @GetMapping("/matchDetail/teamDetail/{teamNo}")
    public ModelAndView goTeamDetailPage(@PathVariable("teamNo") Long teamNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("teamNo", teamNo);
        mav.setViewName("comp/teamDetail");
        return mav;
    }


    /* 경기 기록 페이지로 이동*/
    @GetMapping("/matchRecord/{matchHistoryNo}")
    public ModelAndView goMatchRecordPage(@PathVariable("matchHistoryNo") Long matchHistoryNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("matchHistoryNo", matchHistoryNo);
        mav.setViewName("comp/matchRecord");
        return mav;
    }

    /* 회원가입 두번째 페이지 이동*/
    @GetMapping("/chatPageView")
    public ModelAndView goChatPage() {
        return new ModelAndView("comp/chatPage");
    }

    /* 패배팀 결제 페이지 이동*/
    @GetMapping("/loseTeam/{matchHistoryNo}")
    public ModelAndView goLoseTeamPage(@PathVariable("matchHistoryNo") Long matchHistoryNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("matchHistoryNo", matchHistoryNo);
        mav.setViewName("comp/loseTeamResult");
        return mav;
    }

    /* 승리팀 페이지 */
    @GetMapping("/winTeam")
    public ModelAndView goWinTeamPage(){return new ModelAndView("comp/winTeamResult");}
    /* 무승부팀 페이지 */
    @GetMapping("/drawTeam")
    public ModelAndView goDrawTeamPage() {return new ModelAndView("comp/drawTeamResult");}
    @GetMapping("/teamDetail/{teamNo}")
    public ModelAndView goTeamDetail(@PathVariable Long teamNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("teamNo", teamNo);
        mav.setViewName("comp/teamDetail");

        return mav;
    }

    /* 결제 성공페이지*/
    @GetMapping("/paySuccess")
    public ModelAndView gopaySuccessPage() {
        return new ModelAndView("comp/paySuccess");
    }
    /* 결제 실패 페이지*/
    @GetMapping("/payFail")
    public ModelAndView gopayFailPage() {
        return new ModelAndView("comp/payFail");
    }
    /* 결제 취소 페이지*/
    @GetMapping("/payCancel")
    public ModelAndView gopayCancelPage() {
        return new ModelAndView("comp/payCancel");
    }
    
}
