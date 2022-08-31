package com.nhom13.service;

import com.nhom13.pojo.ServicesDetail;

import java.util.List;

public interface ServiceDetailService {
    boolean addServiceToList(int listServiceId, List<Integer> listService);
}
