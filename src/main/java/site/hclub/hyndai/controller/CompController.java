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

    @GetMapping("/create")
    public ModelAndView createTeam(Locale locale, Model model) {
        log.info("Create Team", locale);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/createTeam");

        return mav;
    }

    /* 매칭 상세페이지로 이동 */
    @GetMapping("/matchDetail")
    public ModelAndView goMatchDetailPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("comp/MatchDetail");
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
    @GetMapping("/loseTeam")
    public ModelAndView goLoseTeamPage() {
        return new ModelAndView("comp/loseTeamResult");
    }

    @GetMapping("/teamDetail/{teamNo}")
    public ModelAndView goTeamDetail(@PathVariable Long teamNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("teamNo", teamNo);
        mav.setViewName("comp/detail/teamDetail");

        return mav;
    }
}
