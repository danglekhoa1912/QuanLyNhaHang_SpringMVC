package com.nhom13.repository;

import com.nhom13.pojo.MenuDish;

import java.util.List;

public interface MenuDishRepository {
    boolean addDishToMenu(int menuId, List<Integer> listDish);
}
