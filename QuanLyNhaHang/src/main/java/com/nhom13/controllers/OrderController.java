package com.nhom13.controllers;
import com.nhom13.service.DishService;
import com.nhom13.service.ServiceResService;
import org.eclipse.persistence.sessions.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Map;
@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
@PropertySource("classpath:launguage-vi.properties")
public class OrderController {
    @RequestMapping("/order")
    public String login() {
        return "order";
    }
}
