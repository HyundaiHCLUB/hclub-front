package site.hclub.hyndai.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Slf4j
@Controller
@RequestMapping("/club")
public class ClubController {
    @GetMapping
    public ModelAndView club(Locale locale, Model model) {
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("club/club");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }

    @GetMapping(value = "/add")
    public ModelAndView clubAdd(Locale locale, Model model) {
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("club/plusClub");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }

    @GetMapping(value = "/add/detail")
    public ModelAndView clubAddDetail(Locale locale, Model model) {
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("club/plusClubWrite");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }

    @GetMapping(value = "/add/loc")
    public ModelAndView clubAddLoc(Locale locale, Model model) {
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("club/plusClubLoc");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }

    @GetMapping(value = "/add/preview")
    public ModelAndView clubAddPreview(Locale locale, Model model) {
        ModelAndView mav = new ModelAndView();
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        mav.setViewName("club/plusClubPreview");
        model.addAttribute("serverTime", formattedDate);

        return mav;
    }

    @GetMapping(value = "/detail/{clubNo}")
    public ModelAndView clubDetail(Model model, @PathVariable Long clubNo) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("club/clubDetail");
        model.addAttribute("clubNo", clubNo);

        return mav;
    }

    @GetMapping(value = "/apply/{clubNo}")
    public ModelAndView clubApply(Model model, @PathVariable Long clubNo) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("club/applyClub");
        model.addAttribute("clubNo", clubNo);

        return mav;
    }


}
