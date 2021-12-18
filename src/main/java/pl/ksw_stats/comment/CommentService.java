package pl.ksw_stats.comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;


public interface CommentService {
    default void like(Comment comment){
    }
    default void dislike(Comment comment){
    }
    default void saveComment(Comment comment, Long fightId){
    }
}
