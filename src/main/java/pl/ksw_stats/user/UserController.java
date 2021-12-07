package pl.ksw_stats.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.ksw_stats.role.RoleRepository;

import java.util.Optional;

@Controller
public class UserController {

    private final UserService userService;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;



    public UserController(UserService userService, UserRepository userRepository, RoleRepository roleRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }


    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user",new User());
        return "user/register";
    }
    @PostMapping("/register")
    public String addAuthorprocess(User user) {
        userService.saveUser(user);
        return "redirect:/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("users",userRepository.findAll());
        return "admin/list";
    }
    @GetMapping("/enable/{id}")
    public String changeEnable(Model model, @PathVariable long id) {
        Optional<User> byId = userRepository.findById(id);
        User user = byId.get();
        if(user.isEnabled()){
            user.setEnabled(false);
        } else {
            user.setEnabled(true);
        }
        userRepository.save(user);
        return "redirect:/list";
    }
    @GetMapping("/xxxxx")
    public String homeXX(Model model) {
        model.addAttribute("list", userRepository.findAll());
        return "bootstrap/index1"; }

}
