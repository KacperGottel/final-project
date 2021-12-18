package pl.ksw_stats.fighter;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.ksw_stats.category.Category;

import java.util.List;

@Repository
public interface FighterRepository extends JpaRepository<Fighter, Long> {
    List<Fighter> findAllByCategory(Category category);
}
