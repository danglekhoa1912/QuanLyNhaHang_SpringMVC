package com.nhom13.service.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.Menu;
import com.nhom13.repository.MenuRepository;
import com.nhom13.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuRepository menuRepository;

    @Override
    public Menu addMenu(List<Integer> dish) {
        return this.menuRepository.addMenu(dish);
    }

    @Override
    public boolean deleteMenu(int id) {
        return this.menuRepository.deleteMenu(id);
    }

    @Override
    public List<Dish> getListDish(int menuId) {
        return this.menuRepository.getListDish(menuId);
    }

    @Override
    public Menu getMenuById(int id) {
        return this.menuRepository.getMenuById(id);
    }
}
