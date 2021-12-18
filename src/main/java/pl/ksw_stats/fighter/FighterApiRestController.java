package pl.ksw_stats.fighter;

import org.springframework.web.bind.annotation.*;
import pl.ksw_stats.JsonResponse;
import pl.ksw_stats.event.Event;

import java.util.List;

@RestController
@RequestMapping(value = "/api/fighter")

public class FighterApiRestController {
private final FighterRepository fighterRepository;

    public FighterApiRestController(FighterRepository fighterRepository) {
        this.fighterRepository = fighterRepository;
    }

    // API


    @RequestMapping(value = "", method = RequestMethod.GET)
    public List<Fighter> fighterReadAll() {
        return fighterRepository.findAll();
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public JsonResponse fighterCreate(@RequestBody Fighter fighter) {
        fighterRepository.save(fighter);
        return new JsonResponse("fighter added successfully", fighter);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Fighter fighterReadById(@PathVariable Long id) {
        return fighterRepository.findById(id).orElseThrow(() -> new RuntimeException("Non matching fighter"));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public JsonResponse updatefighter(@PathVariable Long id, @RequestBody Fighter fighter) {
        fighterRepository.save(fighter);
        return new JsonResponse("updated fighter", fighter);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public JsonResponse deletefighter(@PathVariable Long id) {
        fighterRepository.delete(fighterRepository.findById(id).orElseThrow(() -> new RuntimeException("Non matching fighter")));
        return new JsonResponse("removed fighter id: " + id);
    }


}
