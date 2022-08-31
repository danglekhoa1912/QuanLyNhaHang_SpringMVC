package com.nhom13.controllers;

import com.nhom13.pojo.*;
import com.nhom13.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiDishController {

    @Autowired
    private DishService dishService;
    @Autowired
    private ServiceResService serviceResService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private MenuDishService menuDishService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/dishes")
    public ResponseEntity<List<Dish>> listDish(@RequestParam(value = "categoryId") String categoryId, @RequestParam(value = "page") int page) {
        return new ResponseEntity<>(this.dishService.getDishes(null, categoryId, page), HttpStatus.OK);
    }

    @RequestMapping("/service")
    public ResponseEntity<List<Service>> listService( @RequestParam(value = "page") int page) {
        return new ResponseEntity<>(this.serviceResService.getServicesRes(null, page), HttpStatus.OK);
    }

}
