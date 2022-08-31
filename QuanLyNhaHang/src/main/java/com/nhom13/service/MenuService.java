package com.nhom13.service;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.Menu;

import java.util.List;

public interface MenuService {
    int addMenu();
    boolean deleteMenu(int id);
    List<Dish> getListDish(int menuId);
    Menu getMenuById(int id);
}
