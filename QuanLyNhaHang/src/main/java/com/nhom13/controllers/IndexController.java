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
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @author Admin
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
@PropertySource("classpath:launguage-vi.properties")
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
    public String index(Model model, @RequestParam Map<String,String> params) {

        return "index";
    }

//    @RequestMapping("/order")
//    public String login(Model model, @RequestParam Map<String,String> params) {
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));
//        String categoryId=params.getOrDefault("categoryId","1");
//        model.addAttribute("dishes",this.dishService.getDishes(params,page));
//        model.addAttribute("services",this.serviceResService.getServicesRes(params,page));
//        model.addAttribute("weddingHall",this.weddingHallService.getWeddingHalls(params,page));
//        model.addAttribute("categoryDish",this.categoryDishService.getCategoryDish());
//        model.addAttribute("dishCount",this.dishService.countDish());
//        return "order";
//    }
}
