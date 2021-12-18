package pl.ksw_stats.fighter;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.ksw_stats.fight.FightRepository;
import pl.ksw_stats.user.CurrentUser;

@Controller
public class FighterController {
    private final FighterRepository fighterRepository;
    private final FightRepository fightRepository;

    public FighterController(FighterRepository fighterRepository, FightRepository fightRepository) {
        this.fighterRepository = fighterRepository;
        this.fightRepository = fightRepository;
    }

    @RequestMapping(value = "/fighter/list")
    public String list(Model model, Pageable pageable) {
        Page<Fighter> page = fighterRepository.findAll(pageable);
        model.addAttribute("page", page);
        return "/fighter/list";
    }


    @RequestMapping(value = "/fighter/{id}/details")
    public String list(@PathVariable long id, Model model) {
        model.addAttribute("fighter", fighterRepository.findById(id).get());
        model.addAttribute("fights", fightRepository.findAllByFighterId(id));
        return "/fighter/details";
    }
    @ModelAttribute("")
    public void addAttributes(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        model.addAttribute("currentuser", customUser);
    }


}
