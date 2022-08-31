package com.nhom13.service.impl;

import com.nhom13.pojo.Service;
import com.nhom13.repository.ServiceResRepository;
import com.nhom13.service.ServiceResService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Service
public class ServiceResServiceImpl implements ServiceResService {

    @Autowired
    private ServiceResRepository serviceResRepository;
    @Override
    public List<Service> getServicesRes(Map<String, String> params, int page) {
        return this.serviceResRepository.getServicesRes(params,page);
    }

    @Override
    public boolean addService(Service service) {
        return this.serviceResRepository.addService(service);
    }

    @Override
    public boolean deleteService(int id) {
        return this.serviceResRepository.deleteService(id);
    }

    @Override
    public boolean updateService(Service service) {
        return this.serviceResRepository.updateService(service);
    }
}
