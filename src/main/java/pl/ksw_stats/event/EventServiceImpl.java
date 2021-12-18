package pl.ksw_stats.event;

import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

@Service

public class EventServiceImpl implements EventService {
    private final EventRepository eventRepository;

    public EventServiceImpl(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    @Override
    public void saveEvent(Event event) {
        LocalDate localDate = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(event.getDate()));
        event.setDate(localDate);
        eventRepository.save(event);
    }
}
