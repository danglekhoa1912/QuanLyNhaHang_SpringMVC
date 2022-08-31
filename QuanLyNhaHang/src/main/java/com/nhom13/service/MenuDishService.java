package com.nhom13.service;

import com.nhom13.pojo.MenuDish;

import java.util.List;

public interface MenuDishService {
    boolean addDishToMenu(int menuId, List<Integer> listDish);
}
