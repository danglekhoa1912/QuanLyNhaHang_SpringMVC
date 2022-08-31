package com.nhom13.repository;

import com.nhom13.pojo.Service;

import java.util.List;
import java.util.Map;

public interface ServiceResRepository {
    List<Service> getServicesRes(Map<String,String> params, int page);
    boolean addService(Service service);
    boolean deleteService(int id);
    boolean updateService(Service service);
}
