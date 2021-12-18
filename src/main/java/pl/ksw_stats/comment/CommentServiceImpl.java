package pl.ksw_stats.comment;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import pl.ksw_stats.fight.FightRepository;

import pl.ksw_stats.user.User;
import pl.ksw_stats.user.UserRepository;
import pl.ksw_stats.user.UserService;

@Service
public class CommentServiceImpl implements CommentService {
    private final CommentRepository commentRepository;
    private final FightRepository fightRepository;
    private final UserRepository userRepository;
    private final UserService userService;


    public CommentServiceImpl(CommentRepository commentRepository, FightRepository fightRepository, UserRepository userRepository, UserService userService) {
        this.commentRepository = commentRepository;
        this.fightRepository = fightRepository;
        this.userRepository = userRepository;
        this.userService = userService;

    }

    @Override
    public void like(Comment comment) {
        comment.setLikes(comment.getLikes() + 1);
    }

    @Override
    public void dislike(Comment comment) {
        comment.setLikes(comment.getLikes() - 1);
    }

    @Override
    public void saveComment(Comment comment, Long fightId) {
        comment.setLikes(0);
        comment.setFight(fightRepository.getById(fightId));

//        Metoda żeby pobrac aktualnie zalogowanego usera

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        User user = userService.findByUserName(username);
        comment.setUser(user);

        commentRepository.save(comment);
    }
}
