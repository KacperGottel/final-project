package pl.ksw_stats.fight;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FightRepository extends JpaRepository <Fight, Long> {
    List<Fight> findAllByEvent_Id(Long eventId);
    @Query(nativeQuery = true, value = "select * from fight join fight_fighters ff on fight.id = ff.fight_id where fighters_id = ?")
    List<Fight> findAllByFighterId(Long fighterId);

}
