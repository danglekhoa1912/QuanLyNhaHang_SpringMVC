package com.nhom13.service.impl;

import com.nhom13.pojo.ServicesDetail;
import com.nhom13.repository.ServiceDetailRepository;
import com.nhom13.service.ServiceDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceDetailServiceImpl implements ServiceDetailService {

    @Autowired
    ServiceDetailRepository serviceDetailRepository;

    @Override
    public boolean addServiceToList(int listServiceId, List<Integer> listService) {
        return this.serviceDetailRepository.addServiceToList(listServiceId,listService);
    }
}
