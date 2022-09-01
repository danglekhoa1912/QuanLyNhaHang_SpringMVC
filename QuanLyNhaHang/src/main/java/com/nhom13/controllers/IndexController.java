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
import com.nhom13.validator.UpdateUserValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.persistence.criteria.Order;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    private UserService userService;
    @Autowired
    private PriceWeddingTimeService priceWeddingTimeService;


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
    public String order(Model model, @RequestParam Map<String, String> params, HttpSession session) {
//
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//        LocalDateTime now = LocalDateTime.now();
        model.addAttribute("now",LocalDate.now());

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");
        model.addAttribute("dishes", this.dishService.getDishes(params, categoryId, page));
        model.addAttribute("service",this.serviceResService.getServicesRes(params,page));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        model.addAttribute("categoryDish", this.categoryDishService.getCategoryDish());
        model.addAttribute("dishCount", this.dishService.countDish());
        model.addAttribute("pageSize", env.getProperty("page.size"));
        model.addAttribute("count_dish_1", this.dishService.countDishByCate(1));
        model.addAttribute("count_dish_2", this.dishService.countDishByCate(2));
        model.addAttribute("count_dish_3", this.dishService.countDishByCate(3));
        model.addAttribute("count_dish_4", this.dishService.countDishByCate(4));
        model.addAttribute("session",this.priceWeddingTimeService.getAllPriceWedding());
        return "order";
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

    @GetMapping("/profile")
    public String profile(Model model, HttpSession session) {

        model.addAttribute("user", (User) session.getAttribute("currentUser"));
        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(Model model, @ModelAttribute(value = "user")  User user, BindingResult result,HttpSession session) {
        String errorMes = null;
        if (!result.hasErrors()) {
            User u=(User) session.getAttribute("currentUser");
            u.setName(user.getName());
            u.setEmail(user.getEmail());
            u.setBirthday(user.getBirthday());
            u.setMobile(user.getMobile());
            if (this.userService.updateUser(u)) {
                model.addAttribute("resultUpdate",true);
                return "profile";
            }
            model.addAttribute("resultUpdate",false);
            model.addAttribute("errorMes", errorMes);
            return "profile";
        }
        return "profile";
    }

    @PostMapping("/updatePass")
    public String updatePass(Model model, @RequestParam Map<String, String> params, BindingResult result,HttpSession session) {
//        String errorMes = null;
//        if (!result.hasErrors()) {
//            User u=(User) session.getAttribute("currentUser");
//            u.setName(user.getName());
//            u.setEmail(user.getEmail());
//            u.setBirthday(user.getBirthday());
//            u.setMobile(user.getMobile());
//            if (this.userService.updateUser(u)) {
//                model.addAttribute("resultUpdate",true);
//                return "profile";
//            }
//            model.addAttribute("resultUpdate",false);
//            model.addAttribute("errorMes", errorMes);
//            return "profile";
//        }
        return "profile";
    }
}
