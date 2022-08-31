/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nhom13.controllers;

import com.nhom13.repository.DishRepository;
import com.nhom13.repository.ServiceResRepository;
import com.nhom13.service.CategoryDishService;
import com.nhom13.service.DishService;
import com.nhom13.service.ServiceResService;
import com.nhom13.service.WeddingHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.persistence.criteria.Order;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * @author Admin
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:messages_en.properties")
@PropertySource("classpath:messages_vi.properties")
public class IndexController {

    @Autowired
    private WeddingHallService weddingHallService;
    @Autowired
    private CategoryDishService categoryDishService;
    @Autowired
    private DishService dishService;
    @Autowired
    private ServiceResService serviceResService;
    @Autowired
    private Environment env;

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("dishes_1", this.dishService.getDishes(params, "1", page));
        model.addAttribute("dishes_2", this.dishService.getDishes(params, "2", page));
        model.addAttribute("dishes_3", this.dishService.getDishes(params, "3", page));
        return "index";
    }

    @RequestMapping("/order")
    public String login(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");
        model.addAttribute("dishes", this.dishService.getDishes(params, categoryId, page));
        model.addAttribute("services", this.serviceResService.getServicesRes(params, page));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        model.addAttribute("categoryDish", this.categoryDishService.getCategoryDish());
        model.addAttribute("dishCount", this.dishService.countDish());
        model.addAttribute("pageSize", env.getProperty("page.size"));
        model.addAttribute("count_dish_1",this.dishService.countDishByCate(1));
        model.addAttribute("count_dish_2",this.dishService.countDishByCate(2));
        model.addAttribute("count_dish_3",this.dishService.countDishByCate(3));
        model.addAttribute("count_dish_4",this.dishService.countDishByCate(4));
        return "order";
    }

    @RequestMapping("/services")
    public String services(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");

        model.addAttribute("services", this.serviceResService.getServicesRes(params, page));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        model.addAttribute("categoryDish", this.categoryDishService.getCategoryDish());
        model.addAttribute("dishCount", this.dishService.countDish());
        model.addAttribute("pageSize", env.getProperty("page.size"));
        return "services";
    }
}
