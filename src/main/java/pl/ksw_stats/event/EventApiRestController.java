package pl.ksw_stats.event;

import org.springframework.web.bind.annotation.*;
import pl.ksw_stats.JsonResponse;

import java.util.List;

@RestController
@RequestMapping(value = "/api/event")
public class EventApiRestController {
    private final EventRepository eventRepository;

    public EventApiRestController(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    // API

    @RequestMapping(value = "", method = RequestMethod.GET)
    public List<Event> eventsReadAll() {
        return eventRepository.findAll();
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public JsonResponse eventCreate(@RequestBody Event event) {
        eventRepository.save(event);
        return new JsonResponse("event added successfully", event);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Event eventReadById(@PathVariable Long id) {
        return eventRepository.findById(id).orElseThrow(() -> new RuntimeException("Non matching event"));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public JsonResponse update(@PathVariable Long id, @RequestBody Event event) {
        eventRepository.save(event);
        return new JsonResponse("updated event", event);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public JsonResponse delete(@PathVariable Long id) {
        eventRepository.delete(eventRepository.findById(id).orElseThrow(() -> new RuntimeException("Non matching event")));
        return new JsonResponse("removed event id: " + id);
    }

}
