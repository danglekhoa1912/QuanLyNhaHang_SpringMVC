package com.nhom13.service.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.ListService;
import com.nhom13.repository.ListServiceRepository;
import com.nhom13.service.ListServiceResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListServiceResServiceImpl implements ListServiceResService {

    @Autowired
    ListServiceRepository listServiceRepository;

    @Override
    public int addListService() {
        return this.listServiceRepository.addListService();
    }

    @Override
    public boolean deleteListService(int id) {
        return this.listServiceRepository.deleteListService(id);
    }

    @Override
    public List<com.nhom13.pojo.Service> getListService(int id) {
        return this.listServiceRepository.getListService(id);
    }

    @Override
    public ListService getById(int id) {
        return this.listServiceRepository.getById(id);
    }
}
