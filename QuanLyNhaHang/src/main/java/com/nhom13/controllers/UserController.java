package com.nhom13.controllers;

import com.nhom13.pojo.User;
import com.nhom13.service.UserService;
import com.nhom13.validator.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;


    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.setValidator(this.userValidator);
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDateTime now = LocalDateTime.now();

        model.addAttribute("user", new User());
        model.addAttribute("now",dtf.format(now));
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value="user") @Valid User user, BindingResult result, HttpServletRequest request){
        String errorMes=null;
        if(!result.hasErrors()){
            if(user.getPassword().equals(user.getConfirmPassword())){
                if (this.userService.addUser(user) == true) {
                    return "redirect:/login";
                }
            }
            else {
                errorMes="Mat khau khong khop";
            }
            model.addAttribute("errorMes",errorMes);
            return "register";
        }
        return "register";
        }

}
