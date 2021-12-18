package pl.ksw_stats.category;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.ksw_stats.fighter.FighterRepository;

@Controller
public class CategoryController {
    private final CategoryRepository categoryRepository;
    private final FighterRepository fighterRepository;

    public CategoryController(CategoryRepository categoryRepository, FighterRepository fighterRepository) {
        this.categoryRepository = categoryRepository;
        this.fighterRepository = fighterRepository;
    }

    @RequestMapping(value="/category/list")
    public String list(Model model){
        model.addAttribute("categories" , categoryRepository.findAll());
        return "category/list";
    }
    @RequestMapping(value="/category/{id}/details")
    public String list(Model model, @PathVariable long id){
        model.addAttribute("category" , categoryRepository.findById(id).get());
        model.addAttribute("fighters",fighterRepository.findAllByCategory(categoryRepository.findById(id).get()));
        return "category/details";
    }


}
