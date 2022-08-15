package com.nhom13.repository;

import com.nhom13.pojo.Dish;

import java.util.List;
import java.util.Map;

public interface DishRepository {
    List<Dish> getDishes(Map<String, String> params, int page);
    boolean addDish(Dish dish);
}