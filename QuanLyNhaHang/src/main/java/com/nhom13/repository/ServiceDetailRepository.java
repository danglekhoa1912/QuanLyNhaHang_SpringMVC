package com.nhom13.repository;

import com.nhom13.pojo.ServicesDetail;

import java.util.List;

public interface ServiceDetailRepository {
    boolean addServiceToList(int listServiceId, List<Integer> listService);
}
