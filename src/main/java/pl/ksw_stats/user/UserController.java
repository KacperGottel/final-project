package pl.ksw_stats.user;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.ksw_stats.comment.CommentRepository;
import pl.ksw_stats.role.RoleRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UserController {

    private final UserService userService;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final CommentRepository commentRepository;


    public UserController(UserService userService, UserRepository userRepository, RoleRepository roleRepository, CommentRepository commentRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;

        this.commentRepository = commentRepository;
    }




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

        if (repeatpassword.equals(user.getPassword()))
        {
        userService.saveUser(user);
        return "redirect:user/login";
        } else {
            model.addAttribute("error", "Fail");
            return "/user/register";
        }
    }
    @GetMapping("/user/panel")
    public String userPanel(Model model) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();

        } else {
            username = principal.toString();
        }
        User user = userService.findByUserName(username);
        model.addAttribute("user", user);
        model.addAttribute("usercomments",commentRepository.findAllByUser_Id(user.getId()));
        return "user/panel";
    }





}
