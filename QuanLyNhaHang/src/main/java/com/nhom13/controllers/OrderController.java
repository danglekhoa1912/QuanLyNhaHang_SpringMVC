package com.nhom13.controllers;
import com.nhom13.repository.DishRepository;
import com.nhom13.repository.ServiceResRepository;
import com.nhom13.service.CategoryDishService;
import com.nhom13.service.DishService;
import com.nhom13.service.ServiceResService;
import com.nhom13.service.WeddingHallService;
import org.eclipse.persistence.sessions.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Map;
@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
@PropertySource("classpath:launguage-vi.properties")
public class OrderController {
    @Autowired
    private WeddingHallService weddingHallService;
    @Autowired
    private CategoryDishService categoryDishService;
    @Autowired
    private Environment env;
    @Autowired
    private DishRepository dishService;
    @Autowired
    private ServiceResRepository serviceResService;

    @RequestMapping("/order")
    public String order(Model model, @RequestParam Map<String,String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId=params.getOrDefault("categoryId","1");
        model.addAttribute("dishes",this.dishService.getDishes(params,categoryId,page));
        model.addAttribute("services",this.serviceResService.getServicesRes(params,page));
        model.addAttribute("weddingHall",this.weddingHallService.getWeddingHalls(params,page));
        model.addAttribute("categoryDish",this.categoryDishService.getCategoryDish());
        return "order";
    }
}
