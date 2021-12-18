package pl.ksw_stats.comment;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.ksw_stats.fight.Fight;
import pl.ksw_stats.fight.FightRepository;

@Controller
@Slf4j
public class CommentController {
    private final CommentService commentService;
    private final CommentRepository commentRepository;
    private final FightRepository fightRepository;

    public CommentController(CommentService commentService, CommentRepository commentRepository, FightRepository fightRepository) {
        this.commentService = commentService;
        this.commentRepository = commentRepository;
        this.fightRepository = fightRepository;
    }

    @RequestMapping(value="comment/{id}/like")
    public String likeIt(@PathVariable Long id){
        Comment com = commentRepository.getById(id);
        commentService.like(com);
        commentRepository.save(com);
        return String.format("redirect:/fight/%s/comments",com.getFight().getId());
    }
    @RequestMapping(value="comment/{id}/dislike")
    public String dislikeIt(@PathVariable Long id){
        Comment com = commentRepository.getById(id);
        commentService.dislike(com);
        commentRepository.save(com);
        return String.format("redirect:/fight/%s/comments",com.getFight().getId());
    }

    @RequestMapping(value="comment/{id}/delete")
    public String delete(@PathVariable Long id){
        Comment com = commentRepository.getById(id);
        commentRepository.deleteById(id);
        return String.format("redirect:/fight/%s/comments",com.getFight().getId());
    }
    @RequestMapping(value="user/comment/{id}/delete")
    public String deleteUserComment(@PathVariable Long id){
        Comment com = commentRepository.getById(id);
        commentRepository.deleteById(id);
        return "redirect:/user/panel";
    }
}
