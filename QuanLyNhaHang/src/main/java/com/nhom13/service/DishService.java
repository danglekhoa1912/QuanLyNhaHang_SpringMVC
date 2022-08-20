package com.nhom13.service;

import com.nhom13.pojo.Dish;

import java.util.List;
import java.util.Map;

public interface DishService {
    List<Dish> getDishes(Map<String,String> params, int page);
    Dish getDishById(int id);
    boolean addDish(Dish dish);
}
