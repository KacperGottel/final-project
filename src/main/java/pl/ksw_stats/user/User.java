package pl.ksw_stats.user;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.validator.constraints.UniqueElements;
import pl.ksw_stats.comment.Comment;
import pl.ksw_stats.fighter.Fighter;
import pl.ksw_stats.role.Role;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.PositiveOrZero;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Data
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true, length = 60)
    @NotBlank(message = "Not empty")
    private String username;
    @NotBlank(message = "Not empty password")
    private String password;
    @Email(message = "Email format @")
    @NotBlank(message = "Not empty email")
    private String email;
    private boolean enabled;
    @ManyToMany(fetch = FetchType.LAZY)
    private Set<Fighter> favouriteFighters= new HashSet<>();
    @ManyToOne
    private Role role;
    private String img;






}