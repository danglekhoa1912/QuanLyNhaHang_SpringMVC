package com.nhom13.controllers;

import com.nhom13.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@PropertySource("classpath:messages_en.properties")
@PropertySource("classpath:messages_vi.properties")
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    private WeddingHallService weddingHallService;
    @Autowired
    private CategoryDishService categoryDishService;
    @Autowired
    private DishService dishService;
    @Autowired
    private ServiceResService serviceResService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private Environment env;

    @RequestMapping("")
    public String staff(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        return "staff";
    }

    @RequestMapping("/dishes")
    public String dishes(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");
        String nameDish = params.getOrDefault("nameDish", null);
        System.out.println(params);
        model.addAttribute("dishes", this.dishService.getDishes(params, categoryId, page));
        model.addAttribute("service", this.serviceResService.getServicesRes(params, page));
        model.addAttribute("categoryDish", this.categoryDishService.getCategoryDish());
        model.addAttribute("dishCount", this.dishService.countDish());
        model.addAttribute("pageSize", env.getProperty("page.size"));
        model.addAttribute("count_dish_1", this.dishService.countDishByCate(1));
        model.addAttribute("count_dish_2", this.dishService.countDishByCate(2));
        model.addAttribute("count_dish_3", this.dishService.countDishByCate(3));
        model.addAttribute("count_dish_4", this.dishService.countDishByCate(4));
        //}
        return "dishes";
    }
    @RequestMapping("/service")
    public String service(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        return "service";
    }
    @RequestMapping("/weddinghall")
    public String weddinghall(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        return "weddinghall";
    }
}
