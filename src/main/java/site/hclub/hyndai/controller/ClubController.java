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

    @GetMapping(value = "/district/{districtNo}")
    public ModelAndView getClubByDistrict(Model model, @PathVariable Long districtNo) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("club/districtDetail");
        model.addAttribute("districtNo", districtNo);
        String districtName = getDistrictName(districtNo);
        model.addAttribute("districtName", districtName);
        String districtInfo = getDistrictInfo(districtNo);
        model.addAttribute("districtInfo", districtInfo);
        return mav;
    }

    @GetMapping(value = "/history/{clubNo}")
    public ModelAndView addHistory(Model model, @PathVariable Long clubNo) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("club/plusHistory");
        model.addAttribute("clubNo", clubNo);
        return mav;
    }

    private String getDistrictName(Long districtNo) {
        switch (districtNo.intValue()) {
            case 1:
                return "강남구";
            case 2:
                return "강동구";
            case 3:
                return "마포구";
            case 4:
                return "중구";
            default:
                return "알 수 없는 지역";
        }
    }

    private String getDistrictInfo(Long districtNo) {
        switch (districtNo.intValue()) {
            case 1:
                return "트렌디함의 중심, 강남에서 함께 성장할 멤버를 찾습니다!";
            case 2:
                return "강동에서 활기차고 즐거운 동아리 생활을 시작해봐요! ";
            case 3:
                return "마포의 중심에서 함께 멋진 경험을 만들어봐요! ";
            case 4:
                return "중구의 동아리에서 새로운 친구들과 소중한 경험을 만들어보세요! ";
            default:
                return "알 수 없는 지역";
        }
    }
}
