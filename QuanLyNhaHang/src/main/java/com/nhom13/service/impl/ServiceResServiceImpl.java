package com.nhom13.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nhom13.pojo.Service;
import com.nhom13.repository.ServiceResRepository;
import com.nhom13.service.ServiceResService;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Service
public class ServiceResServiceImpl implements ServiceResService {

    @Autowired(required = false)
    private Cloudinary cloudinary;

    @Autowired
    private ServiceResRepository serviceResRepository;
    @Override
    public List<Service> getServicesRes(Map<String, String> params, int page) {
        return this.serviceResRepository.getServicesRes(params,page);
    }

    @Override
    public boolean addService(Service service) {
        try {
            Map res = this.cloudinary.uploader().upload(service.getImg().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            service.setImage(res.get("secure_url").toString());
            return this.serviceResRepository.addService(service);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleteService(int id) {
        return this.serviceResRepository.deleteService(id);
    }

    @Override
    public boolean updateService(Service service) {
        try {
            Map res = this.cloudinary.uploader().upload(service.getImg().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            service.setImage(res.get("secure_url").toString());
            return this.serviceResRepository.updateService(service);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}
