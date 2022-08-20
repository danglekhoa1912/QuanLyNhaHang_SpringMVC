package com.nhom13.controllers;

import com.nhom13.service.ServiceResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class ServiceResController {

    @Autowired
    private ServiceResService serviceResService;

    @RequestMapping("/serviceRes/")
    public String get(Model model, @RequestParam Map<String,String> params){
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("services",this.serviceResService.getServicesRes(params,page));
        return "index";
    }
}
