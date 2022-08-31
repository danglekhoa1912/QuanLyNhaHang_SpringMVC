package com.nhom13.repository;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.Menu;

import java.util.List;

public interface MenuRepository {
    int addMenu();
    boolean deleteMenu(int id);
    List<Dish> getListDish(int menuId);
    Menu getMenuById(int id);
}
