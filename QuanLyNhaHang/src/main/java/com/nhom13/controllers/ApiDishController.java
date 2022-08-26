package com.nhom13.controllers;

import com.nhom13.pojo.Dish;
import com.nhom13.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ApiDishController {

    @Autowired
    private DishService dishService;

    @RequestMapping("/dishes")
    public ResponseEntity<List<Dish>> list(@RequestParam(value = "categoryId") String categoryId,@RequestParam(value = "page") int page){
        return new ResponseEntity<>(this.dishService.getDishes(null,categoryId,page), HttpStatus.OK);
    }
}
