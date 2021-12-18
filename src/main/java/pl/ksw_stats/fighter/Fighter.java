package pl.ksw_stats.fighter;

import lombok.Data;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;
import pl.ksw_stats.category.Category;
import pl.ksw_stats.fight.Fight;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.util.List;

@Entity
@Data
public class Fighter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private Integer titles;
    private String nationality;
    @Pattern(regexp = "\\d*-\\d*-\\d*-\\d*", message = "Format: WINS-LOSES-DRAWS-KOs")
    private String record;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birth;
    private int height;
    private int weight;
    private String clubName;
    private String primaryStyle;
    @ManyToOne
    private Category category;
    private String img;


}
