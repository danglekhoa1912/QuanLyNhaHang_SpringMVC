package com.nhom13.repository;

import com.nhom13.pojo.Dish;

import java.util.List;
import java.util.Map;

public interface DishRepository {
    List<Dish> getDishes(Map<String, String> params,String categoryId, int page);
    Dish getDishById(int id);
    boolean addDish(Dish dish);
    int countDish();
}
