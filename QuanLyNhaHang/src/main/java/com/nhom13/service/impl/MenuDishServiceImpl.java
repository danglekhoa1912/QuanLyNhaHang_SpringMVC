package com.nhom13.service.impl;

import com.nhom13.pojo.MenuDish;
import com.nhom13.repository.MenuDishRepository;
import com.nhom13.service.MenuDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuDishServiceImpl implements MenuDishService {

    @Autowired
    MenuDishRepository menuDishRepository;

    @Override
    public boolean addDishToMenu(int menuId, List<Integer> listDish) {
        return this.menuDishRepository.addDishToMenu(menuId,listDish);
    }
}
