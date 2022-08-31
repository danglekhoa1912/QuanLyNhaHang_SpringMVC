package com.nhom13.repository;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.ListService;
import com.nhom13.pojo.Service;

import java.util.List;

public interface ListServiceRepository {
    int addListService();
    boolean deleteListService(int id);
    List<Service> getListService(int id);
    ListService getById(int id);
}
