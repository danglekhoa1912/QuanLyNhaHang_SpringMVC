package com.nhom13.controllers;

import com.nhom13.service.*;
import org.springframework.core.env.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@PropertySource("classpath:messages_en.properties")
@PropertySource("classpath:messages_vi.properties")
@RequestMapping("/admin")
public class AdminController {
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

    @RequestMapping("/dishesmanage")
    public String dishesmanage(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String categoryId = params.getOrDefault("categoryId", "1");
        String nameDish = params.getOrDefault("nameDish", null);
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
        return "dishesmanage";
    }
    @RequestMapping("/servicemanage")
    public String service(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        return "servicemanage";
    }
    @RequestMapping("/weddinghallmanage")
    public String weddinghall(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        return "weddinghallmanage";
    }
    @RequestMapping("/accountmanage")
    public String accountmanage(Model model, @RequestParam Map<String, String> params){
        int page=Integer.parseInt(params.getOrDefault("page", "1"));
        String role=params.getOrDefault("role",null);
        if (role==null){
            params.put("role","ROLE_STAFF");
            model.addAttribute("title",env.getProperty("admin.account.user"));
        }
        else if (role.equals("ROLE_STAFF")){
            model.addAttribute("type","ROLE_STAFF");
            model.addAttribute("title",env.getProperty("admin.account.user"));
        }
        else if (role.equals("ROLE_USER")){
            model.addAttribute("type","ROLE_USER");
            model.addAttribute("title",env.getProperty("admin.account.cus"));
        }
        System.out.println("hello:"+this.userService.getUserByRole(params,page));
        model.addAttribute("listAccount",this.userService.getUserByRole(params,page));
        model.addAttribute("accountCounter",this.userService.countAccount(params));
        model.addAttribute("pageSize",Integer.parseInt(env.getProperty("page.size")));
        return "accountmanage";
    }
    @RequestMapping ("/statistical")
    public String statistical(Model model, @RequestParam Map<String, String> params){
        int page=Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("listOrder",this.orderService.getOrder(params,page));
        model.addAttribute("pageSize",env.getProperty("page.size"));
        model.addAttribute("counter",this.orderService.getCountOrder());
        System.out.println(this.orderService.getOrder(params,page).size());
        return "statistical";
    }
}
