package pl.ksw_stats.home;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.ksw_stats.rss.Feed;
import pl.ksw_stats.rss.FeedMessage;
import pl.ksw_stats.rss.RSSFeedParser;
import pl.ksw_stats.user.CurrentUser;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @RequestMapping(value = "")
    public String home(Model model) {
        RSSFeedParser parser = new RSSFeedParser(
                "https://www.polsatsport.pl/rss/sportywalki.xml");
        Feed feed = parser.readFeed();
        List<FeedMessage> messages = feed.getMessages();
        model.addAttribute("feed",feed);
        return "home/home";
    }

    @RequestMapping(value = "/about")
    public String about() {
        return "home/about";
    }

    @RequestMapping(value = "/contact")
    public String contact() {
        return "home/contact";
    }

    @RequestMapping(value = "/api")
    public String api() {
        return "home/api";
    }

    @ModelAttribute("")
    public void addAttributes(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        model.addAttribute("currentuser", customUser);
    }
}
