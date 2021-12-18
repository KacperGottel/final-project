package pl.ksw_stats.comment;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import pl.ksw_stats.fight.Fight;
import pl.ksw_stats.user.User;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Data
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Empty comment")
    @Size(min = 5,max = 50,message = "5 to 50 characters")
    private String content;
    private int likes;
    @ManyToOne
    private User user;
    @ManyToOne
    private Fight fight;

}
