package com.nhom13.service.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.repository.DishRepository;
import com.nhom13.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DishServiceImpl implements DishService {
    @Autowired
    private DishRepository dishRepository;

    @Override
    public List<Dish> getDishes(Map<String, String> params,String categoryId, int page) {
        return this.dishRepository.getDishes(params,categoryId,page);
    }

    @Override
    public Dish getDishById(int id) {
        return this.dishRepository.getDishById(id);
    }

    @Override
    public boolean addDish(Dish dish) {
        return this.dishRepository.addDish(dish);
    }

    @Override
    public boolean deleteDish(int id) {
        return this.dishRepository.deleteDish(id);
    }

    @Override
    public boolean updateDish(Dish dish) {
        return this.dishRepository.updateDish(dish);
    }

    @Override
    public int countDish() {
        return this.dishRepository.countDish();
    }

    @Override
    public int countDishByCate(int categoryId) {
        return this.dishRepository.countDishByCate(categoryId);
    }
}
