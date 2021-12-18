package pl.ksw_stats.category;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import pl.ksw_stats.fight.Fight;

import java.util.List;

@RestController
@RequestMapping(value = "/api/category")
public class CategoryApiRestController {
    private final CategoryRepository categoryRepository;

    public CategoryApiRestController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public List<Category> fightReadAll() {
        return categoryRepository.findAll();
    }

}
