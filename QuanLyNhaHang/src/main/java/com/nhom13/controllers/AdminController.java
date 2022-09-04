package com.nhom13.controllers;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.Service;
import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.service.*;
import com.nhom13.validator.HallValidator;
import com.nhom13.validator.UserValidator;
import org.springframework.core.env.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
    
    @Autowired
    private HallValidator hallValidator;


    @InitBinder("hall")
    public void initBinder(WebDataBinder binder){
        binder.setValidator(this.hallValidator);
    }
    
    @RequestMapping("")
    public String index(Model model, @RequestParam Map<String, String> params){
        int page=Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("listOrder",this.orderService.getOrder(params,page));
        model.addAttribute("pageSize",env.getProperty("page.size"));
        model.addAttribute("counter",this.orderService.getCountOrder());
        System.out.println(this.orderService.getOrder(params,page).size());
        return "statistical";
    }    
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
        model.addAttribute("newDish",new Dish());
        //}
        return "dishesmanage";
    }

    @PostMapping("/dishesmanage")
    public String addDish(@ModelAttribute(value ="newDish") Dish dish,BindingResult result){
        if(!result.hasErrors()){
            if(dish.getId()!=null){
                if(this.dishService.updateDish(dish))
                    return "redirect:dishesmanage";
            }else {
                if(this.dishService.addDish(dish))
                    return "redirect:dishesmanage";
            }
        }
        return "redirect:dishesmanage";
    }

    @RequestMapping("/servicemanage")
    public String service(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("newService",new Service());
        return "servicemanage";
    }

    @PostMapping("/servicemanage")
    public String addService(@ModelAttribute(value ="newService") Service service,BindingResult result){
        if(!result.hasErrors()){
            if(service.getId()!=null){
                if(this.serviceResService.updateService(service))
                    return "redirect:servicemanage";
            }else {
                if(this.serviceResService.addService(service))
                    return "redirect:servicemanage";
            }
        }
        return "redirect:servicemanage";
    }

    @RequestMapping("/weddinghallmanage")
    public String weddinghall(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("weddingHall", this.weddingHallService.getWeddingHalls(params, page));
        model.addAttribute("hall",new WeddingHall());
        return "weddinghallmanage";
    }

    @PostMapping("/weddinghallmanage")
    public String addWeddinghall(@ModelAttribute(value="hall") @Valid WeddingHall hall, BindingResult result){
        if(!result.hasErrors()){
            if(hall.getId()!=null){
                if(this.weddingHallService.updateWeddingHall(hall))
                    return "redirect:weddinghallmanage";
            }
            else {
                if(this.weddingHallService.addWeddingHall(hall))
                    return "redirect:weddinghallmanage";
            }
        }
        return "redirect:weddinghallmanage";
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
        model.addAttribute("listAccount",this.userService.getUserByRole(params,page));
        model.addAttribute("accountCounter",this.userService.countAccount(params));
        model.addAttribute("pageSize",Integer.parseInt(env.getProperty("page.size")));
        model.addAttribute("newStaff", new User());
        return "accountmanage";
    }

    @PostMapping("/accountmanage")
    public String accountmanage(@ModelAttribute(value = "newStaff") User newStaff) throws ParseException {
        this.userService.addStaff(newStaff);
        return "redirect:accountmanage";
    }

    @RequestMapping ("/statistical")
    public String statistical(Model model, @RequestParam Map<String, String> params){
        int page=Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("listOrder",this.orderService.getOrder(params,page));
        model.addAttribute("pageSize",env.getProperty("page.size"));
        model.addAttribute("counter",this.orderService.getCountOrder());
        return "statistical";
    }


}
