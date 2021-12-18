package pl.ksw_stats.fight;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.ksw_stats.comment.Comment;
import pl.ksw_stats.comment.CommentService;
import pl.ksw_stats.user.CurrentUser;
import pl.ksw_stats.user.SpringDataUserDetailsService;

import javax.validation.Valid;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Controller
@Slf4j
public class FightController {
    private final FightRepository fightRepository;
    private final CommentService commentService;
    private final SpringDataUserDetailsService springDataUserDetailsService;

    public FightController(FightRepository fightRepository, CommentService commentService, SpringDataUserDetailsService springDataUserDetailsService) {
        this.fightRepository = fightRepository;
        this.commentService = commentService;
        this.springDataUserDetailsService = springDataUserDetailsService;
    }

    @RequestMapping(value = "/fight/{id}/comments")
    public String list(Model model, @PathVariable Long id) {
        Optional<Fight> fightOptional = fightRepository.findById(id);
        Fight fight = fightOptional.orElseThrow(() -> new NoSuchElementException("No such fight"));
        List<Comment> comments = fight.getComments();
        model.addAttribute("comments", comments);
        model.addAttribute("fight", fight);
        return "fight/comments";
    }

    @RequestMapping(value = "/fight/{id}/video")
    public String video(Model model, @PathVariable long id) {
        model.addAttribute("fight", fightRepository.findById(id).get());
        return "fight/video";
    }

    @RequestMapping(value = "/fight/{id}/comment/add")
    public String commentAdd(Model model, @PathVariable long id) {
        model.addAttribute("fight", fightRepository.findById(id).get());
        model.addAttribute("comment", new Comment());
        return "fight/comment-form";
    }

    @PostMapping(value = "/fight/{id}/comment/add")
    public String commentProcess(@Valid Comment comment, BindingResult bindingResult, Model model,@PathVariable long id) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("fight", fightRepository.findById(id).get());
            return "fight/comment-form";
        }
        commentService.saveComment(comment, id);
        return String.format("redirect:/fight/%s/comments", id);
    }
    @ModelAttribute("")
    public void addAttributes(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        model.addAttribute("currentuser", customUser);
    }
}
