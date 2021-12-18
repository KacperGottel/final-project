package pl.ksw_stats.fight;

import lombok.Data;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import pl.ksw_stats.comment.Comment;
import pl.ksw_stats.event.Event;
import pl.ksw_stats.fighter.Fighter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
@Data
public class Fight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Event event;
    private String result;
    @OneToMany(mappedBy = "fight")
    private List<Comment> comments;
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Fighter> fighters;
    private String youtube;

}
