package com.nhom13.service;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.ListService;
import com.nhom13.pojo.Service;

import java.util.List;

public interface ListServiceResService {
    int addListService();
    boolean deleteListService(int id);
    List<Service> getListService(int id);
    ListService getById(int id);
}
