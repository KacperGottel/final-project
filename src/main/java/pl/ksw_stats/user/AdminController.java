package pl.ksw_stats.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.ksw_stats.category.Category;
import pl.ksw_stats.category.CategoryRepository;
import pl.ksw_stats.event.Event;
import pl.ksw_stats.event.EventRepository;
import pl.ksw_stats.event.EventService;
import pl.ksw_stats.fight.Fight;
import pl.ksw_stats.fight.FightRepository;
import pl.ksw_stats.fighter.Fighter;
import pl.ksw_stats.fighter.FighterRepository;
import pl.ksw_stats.role.RoleRepository;

import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@Slf4j
public class AdminController {

    private final EventRepository eventRepository;
    private final FightRepository fightRepository;
    private final FighterRepository fighterRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final UserService userService;
    private final EventService eventService;
    private final RoleRepository roleRepository;

    public AdminController(EventRepository eventRepository, FightRepository fightRepository, FighterRepository fighterRepository, CategoryRepository categoryRepository, UserRepository userRepository, UserService userService, EventService eventService, RoleRepository roleRepository) {
        this.eventRepository = eventRepository;
        this.fightRepository = fightRepository;
        this.fighterRepository = fighterRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.userService = userService;
        this.eventService = eventService;
        this.roleRepository = roleRepository;
    }

    public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/resources/img/uploads";

    @RequestMapping("/403")
    public String page403() {
        return "user/403";
    }

    @RequestMapping(value = "/admin/panel")
    public String adminPanel(Model model) {
        model.addAttribute("events", eventRepository.findAll());
        model.addAttribute("fights", fightRepository.findAll());
        model.addAttribute("fighters", fighterRepository.findAll());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("users", userRepository.findAll());

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();

        } else {
            username = principal.toString();
        }

        if (username.equals("anonymousUser")) {
            return "redirect:/login";
        }

        User user = userService.findByUserName(username);
        model.addAttribute("user", user);

        return "admin/panel";
    }

    @RequestMapping("/event/add")
    public String eventAddForm(Model model) {
        model.addAttribute("event", new Event());
        return "event/add";
    }

    @PostMapping("/event/add")
    public String eventAddProcess(@Valid Event event, BindingResult bindingResult, Model model) {
        log.info(event.toString());

        if (bindingResult.hasErrors()) {
            model.addAttribute("event", new Event());
            return "event/add";
        }
        eventRepository.save(event);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/event/{eventId}/update")
    public String eventUpdate(Model model, @PathVariable long eventId) {
        model.addAttribute("event", eventRepository.getById(eventId));
        return "event/update";
    }

    @PostMapping("/event/{eventId}/update")
    public String event(@Valid Event event, BindingResult bindingResult, Model model, @PathVariable long eventId) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("event", eventRepository.getById(eventId));
            return "event/update";
        }
        eventRepository.save(event);
        return "redirect:/admin/panel";

    }


    @RequestMapping("/fighter/add")
    public String fighterAdd(Model model) {
        model.addAttribute("fighter", new Fighter());
        model.addAttribute("categories", categoryRepository.findAll());
        return "fighter/add";
    }

    @PostMapping("/fighter/add")
    public String eventAddProcess(@Valid Fighter fighter, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("fighter", new Fighter());
            return "fighter/add";
        }
        fighterRepository.save(fighter);
        return "redirect:/admin/panel";
    }

    //    UPLOAD IMG FIGHTER
    @RequestMapping("/fighter/{fighterId}/upload")
    public String fighterUploadIMGForm(@PathVariable long fighterId, Model model) {
        model.addAttribute("fighter", fighterRepository.getById(fighterId));
        return "fighter/upload";
    }

    @PostMapping("/fighter/{fighterId}/upload")
    public String fighterUploadIMGProcess(@PathVariable long fighterId, @RequestParam("file") MultipartFile file) {
        Path fileNameAndPath = Paths.get(uploadDirectory, "fghtr" + fighterId + file.getOriginalFilename());
        try {
            Files.write(fileNameAndPath, file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        Fighter fighter = fighterRepository.getById(fighterId);
        fighter.setImg("/resources/img/uploads/" + "fghtr" + fighterId + file.getOriginalFilename());
        fighterRepository.save(fighter);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/user/{userId}/enabled")
    public String setEnabled(@PathVariable long userId) {
        User user = userRepository.getById(userId);
        if (user.isEnabled()) {
            user.setEnabled(false);
        } else {
            user.setEnabled(true);
        }
        userRepository.save(user);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/user/{userId}/role")
    public String setRole(@PathVariable long userId) {
        User user = userRepository.getById(userId);
        if (user.getRole().getId() == 1) {
            user.setRole(roleRepository.getById(2));
        } else {
            user.setRole(roleRepository.getById(1));
        }
        userRepository.save(user);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/fighter/{fighterId}/update")
    public String updateFighterForm(@PathVariable long fighterId, Model model) {
        model.addAttribute("fighter", fighterRepository.getById(fighterId));
        model.addAttribute("categories", categoryRepository.findAll());
        return "fighter/update";
    }

    @PostMapping("/fighter/{fighterId}/update")
    public String updateFighterPost(@Valid Fighter fighter, BindingResult bindingResult, @PathVariable long fighterId, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("fighter", fighterRepository.getById(fighterId));
            model.addAttribute("categories", categoryRepository.findAll());
            return "fighter/update";
        }
        fighterRepository.save(fighter);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/fight/add")
    public String fightAdd(Model model) {
        model.addAttribute("fighters", fighterRepository.findAll());
        model.addAttribute("fight", new Fight());
        model.addAttribute("events", eventRepository.findAll());
        return "fight/add";
    }

    @PostMapping("/fight/add")
    public String fightAddPost(@Valid Fight fight, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("fighters", fighterRepository.findAll());
            model.addAttribute("fight", new Fight());
            model.addAttribute("events", eventRepository.findAll());
            return "fight/add";
        }
        fightRepository.save(fight);
        return "redirect:/admin/panel";
    }

    @RequestMapping("fight/{fightId}/update")
    public String fightUpdate(Model model, @PathVariable long fightId) {
        model.addAttribute("fighters", fighterRepository.findAll());
        model.addAttribute("fight", fightRepository.getById(fightId));
        model.addAttribute("events", eventRepository.findAll());
        return "fight/update";
    }

    @PostMapping("fight/{fightId}/update")
    public String fightUpdatePost(@Valid Fight fight, BindingResult bindingResult, Model model, @PathVariable long fightId) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("fighters", fighterRepository.findAll());
            model.addAttribute("fight", fightRepository.getById(fightId));
            model.addAttribute("events", eventRepository.findAll());
            return "fight/update";
        }
        fightRepository.save(fight);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/category/add")
    public String categoryAdd(Model model) {
        model.addAttribute("category", new Category());
        return "/category/add";
    }

    @PostMapping("/category/add")
    public String categoryAddPost(@Valid Category category, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("category", new Category());
            return "/category/add";
        }
        categoryRepository.save(category);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/category/{cid}/update")
    public String updateCategory(@PathVariable long cid, Model model) {
        model.addAttribute("category", categoryRepository.getById(cid));
        return "category/update";
    }

    @PostMapping("/category/{cid}/update")
    public String updateCategoryPost(@Valid Category category, BindingResult bindingResult, @PathVariable long cid, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("category", categoryRepository.getById(cid));
            return "category/update";
        }
        categoryRepository.save(category);
        return "redirect:/admin/panel";
    }

    @ModelAttribute("")
    public void addAttributes(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        model.addAttribute("currentuser", customUser);
    }
}
