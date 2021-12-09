package pl.ksw_stats.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.ksw_stats.comment.CommentRepository;
import pl.ksw_stats.fighter.Fighter;
import pl.ksw_stats.fighter.FighterRepository;
import pl.ksw_stats.role.RoleRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.awt.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.util.Set;

@Controller
@Slf4j
public class UserController {

    private final UserService userService;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final CommentRepository commentRepository;
    private final FighterRepository fighterRepository;



    public UserController(UserService userService, UserRepository userRepository, RoleRepository roleRepository, CommentRepository commentRepository, FighterRepository fighterRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;

        this.commentRepository = commentRepository;
        this.fighterRepository = fighterRepository;
    }

    public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/resources/img/uploads" ;

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping("/register")
    public String registerProcess(@Valid User user, BindingResult bindingResult, HttpServletRequest request, Model model) {
        String repeatpassword = request.getParameter("repeatpassword");
        if (bindingResult.hasErrors()) {
            return "/user/register";
        }

        if (repeatpassword.equals(user.getPassword())) {
            userService.saveUser(user);
            return "redirect:/login";
        } else {
            model.addAttribute("error", "Fail");
            return "/user/register";
        }
    }

    @RequestMapping("/user/panel")
    public String userPanel(Model model) {

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
        model.addAttribute("usercomments", commentRepository.findAllByUser_Id(user.getId()));
        return "user/panel";
    }

    @RequestMapping("/user/{userid}/favouritefighters/{fighterid}/delete")
    public String favouriteFighterDelete(@PathVariable long userid, @PathVariable long fighterid) {
        User user = userRepository.getById(userid);
        Set<Fighter> favouriteFighters = user.getFavouriteFighters();
        favouriteFighters.forEach(f -> {
            if (f.getId().equals(fighterid)) {
                favouriteFighters.remove(f);
            }
        });
        user.setFavouriteFighters(favouriteFighters);
        userRepository.save(user);
        return "redirect:/user/panel";
    }

    @RequestMapping("/user/{userId}/confirm")
    public String userConfirmDelete(Model model, @PathVariable long userId) {
        model.addAttribute("user", userRepository.getById(userId));
        return "user/confirm";
    }

    @RequestMapping("/user/{userId}/delete")
    public String userDelete(@PathVariable long userId) {
        userRepository.deleteById(userId);
        return "home/home";
    }

    @RequestMapping("/user/{userId}/favouritefighters/list")
    public String addFavouriteFighterfromList(@PathVariable long userId, Model model) {
        model.addAttribute("user", userRepository.getById(userId));
        model.addAttribute("fighters", fighterRepository.findAll());
        return "user/allfighters";
    }

    @RequestMapping("/user/{userId}/favouritefighters/{fighterId}/add")
    public String addFavouriteFighter(@PathVariable long userId, @PathVariable long fighterId) {
        User user = userRepository.getById(userId);
        Fighter fighter = fighterRepository.getById(fighterId);
        Set<Fighter> favouriteFighters = user.getFavouriteFighters();
        favouriteFighters.add(fighter);
        user.setFavouriteFighters(favouriteFighters);
        userRepository.save(user);
        return "redirect:/user/panel";
    }

    @RequestMapping("/user/{userId}/update")
    public String userUpdateForm(@PathVariable long userId, Model model) {
        model.addAttribute("user", userRepository.getById(userId));
        return "user/update";
    }

    @PostMapping("/user/{userId}/update")
    public String userUpdatePost(@Valid User user, BindingResult bindingResult, @PathVariable long userId, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("user", userRepository.getById(userId));
            return "user/update";
        }
        userService.saveUser(user);
        return "/user/panel";
    }

    //    UPLOAD
    @RequestMapping("/user/{userId}/upload")
    public String userUploadIMGForm(@PathVariable long userId, Model model) {
        model.addAttribute("user", userRepository.getById(userId));
        return "user/upload";
    }
    @PostMapping("/user/{userId}/upload")
    public String userUploadIMGProcess(@PathVariable long userId, Model model, @RequestParam("file") MultipartFile file) {
        Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
        try {
            Files.write(fileNameAndPath, file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        User user = userRepository.getById(userId);
        user.setImg("/resources/img/uploads/" + file.getOriginalFilename());
        userRepository.save(user);
        return "redirect:/user/panel";
    }


}
