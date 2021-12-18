package pl.ksw_stats.event;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.ksw_stats.fight.FightRepository;
import pl.ksw_stats.user.CurrentUser;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Controller
public class EventController {
    private final EventRepository eventRepository;
    private final FightRepository fightRepository;

    public EventController(EventRepository eventRepository, FightRepository fightRepository) {
        this.eventRepository = eventRepository;
        this.fightRepository = fightRepository;
    }

    @RequestMapping(value = "event/list")
    public String list(Model model) {
        model.addAttribute("list", eventRepository.findAll());
        return "event/list";
    }

    @RequestMapping(value = "event/{id}/fightcard")
    public String list(Model model, @PathVariable Long id) {
        Optional<Event> event = eventRepository.findById(id);
        model.addAttribute("event", event.get());
        model.addAttribute("fightcard", fightRepository.findAllByEvent_Id(id));
        return "event/fightcard";
    }
    @ModelAttribute("")
    public void addAttributes(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        model.addAttribute("currentuser", customUser);
    }


}
