package com.nhom13.service.impl;

import com.nhom13.pojo.CategoryDish;
import com.nhom13.repository.CategoryDishRepository;
import com.nhom13.service.CategoryDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryDishServiceImpl implements CategoryDishService {

    @Autowired
    CategoryDishRepository categoryDishRepository;

    @Override
    public List<CategoryDish> getCategoryDish() {
        return this.categoryDishRepository.getCategoryDish();
    }
}
