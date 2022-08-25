package com.nhom13.service.impl;

import com.nhom13.pojo.WeddingHall;
import com.nhom13.repository.WeddingHallRepository;
import com.nhom13.service.WeddingHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class WeddingHallServiceImpl implements WeddingHallService {
    @Autowired
    private WeddingHallRepository weddingHallRepository;
    @Override
    public List<WeddingHall> getWeddingHalls(Map<String, String> params, int page) {
        return this.weddingHallRepository.getWeddingHalls(params,page);
    }
}
