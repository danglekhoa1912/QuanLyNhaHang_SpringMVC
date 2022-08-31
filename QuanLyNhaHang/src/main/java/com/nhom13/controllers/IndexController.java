/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nhom13.controllers;

import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.repository.DishRepository;
import com.nhom13.repository.ServiceResRepository;
import com.nhom13.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
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
    private MenuService menuService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private Environment env;

    @RequestMapping("/order")
    public String login(Model model, @RequestParam Map<String, String> params, HttpSession session) {

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");
        model.addAttribute("dishes", this.dishService.getDishes(params, categoryId, page));
        model.addAttribute("services", this.serviceResService.getServicesRes(params, page));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        model.addAttribute("categoryDish", this.categoryDishService.getCategoryDish());
        model.addAttribute("dishCount", this.dishService.countDish());
        model.addAttribute("pageSize", env.getProperty("page.size"));
        return "order";
    }

    @RequestMapping("/services")
    public String services(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");
        model.addAttribute("dishes_1", this.dishService.getDishes(params, "1", page));
        model.addAttribute("dishes_2", this.dishService.getDishes(params, "2", page));
        model.addAttribute("dishes_3", this.dishService.getDishes(params, "3", page));
        model.addAttribute("dishes_4", this.dishService.getDishes(params, "4", page));

        //model.addAttribute("allDishes",this.dishService.getAllDishes(params,page));
        model.addAttribute("services", this.serviceResService.getServicesRes(params, page));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        model.addAttribute("categoryDish", this.categoryDishService.getCategoryDish());
        model.addAttribute("dishCount", this.dishService.countDish());
        model.addAttribute("pageSize", env.getProperty("page.size"));
        return "services";
    }

    @RequestMapping("/receipt")
    public String createOrder(Model model, @RequestParam Map<String, String> params, HttpSession session) {

//        User user = (User) session.getAttribute("currentUser");
//        int userId=user.getId();
//        int menuId= 1;
//        int listServiceId= 1;
//        int weddinghallId= 1;
//        int priceWeddingId= 1;
//        Date orderDate=new Date();
//        int amount= 50000;
//        String typePay="Momo";
//        int quantityTable=300;
//        WeddingPartyOrders order= orderService.addOrder(userId,menuId,listServiceId,weddinghallId,priceWeddingId,orderDate,amount,typePay,quantityTable);
        return "order";
    }
}
