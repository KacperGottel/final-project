package pl.ksw_stats.fight;

import org.springframework.web.bind.annotation.*;
import pl.ksw_stats.JsonResponse;
import pl.ksw_stats.fighter.Fighter;

import java.util.List;

@RestController
@RequestMapping(value = "/api/fight")
public class FightApiRestController {
    private final FightRepository fightRepository;

    public FightApiRestController(FightRepository fightRepository) {
        this.fightRepository = fightRepository;
    }
    // API

    @RequestMapping(value = "", method = RequestMethod.GET)
    public List<Fight> fightReadAll() {
        return fightRepository.findAll();
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public JsonResponse fightCreate(@RequestBody Fight fight) {
        fightRepository.save(fight);
        return new JsonResponse("fight added successfully", fight);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Fight fightReadById(@PathVariable Long id) {
        return fightRepository.findById(id).orElseThrow(() -> new RuntimeException("Non matching fight"));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public JsonResponse updatefight(@PathVariable Long id, @RequestBody Fight fight) {
        fightRepository.save(fight);
        return new JsonResponse("updated fight", fight);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public JsonResponse deletefight(@PathVariable Long id) {
        fightRepository.delete(fightRepository.findById(id).orElseThrow(() -> new RuntimeException("Non matching fight")));
        return new JsonResponse("removed fight id: " + id);
    }
}
