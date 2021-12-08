package pl.ksw_stats.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "user/login";
    }
//    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
//    public String loginPost() {
//        return "/user/panel";
//    }

    @RequestMapping(value = {"user/login"}, method = RequestMethod.GET)
    public String register() {
        return "user/login";
    }

//    @RequestMapping(value = {"user/login"}, method = RequestMethod.POST)
//    public String registerPost() {
//        return "redirect:/login";
//    }

}
