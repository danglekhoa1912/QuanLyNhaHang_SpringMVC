package com.nhom13.controllers;

import com.nhom13.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class DishController {
    @Autowired
    private DishService dishService;
    @Autowired
    private Environment env;

    @RequestMapping("/dish")
    public String get(Model model, @RequestParam Map<String,String> params){
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("dishes",this.dishService.getDishes(params,page));
        return "index";
    }
}
