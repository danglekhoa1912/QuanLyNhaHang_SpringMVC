package com.nhom13.service.impl;

import com.nhom13.pojo.PriceWeddingTime;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.repository.WeddingHallRepository;
import com.nhom13.service.WeddingHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    @Override
    public WeddingHall getWeddingHallById(int id) {
        return this.weddingHallRepository.getWeddingHallById(id);
    }

    @Override
    public boolean addWeddingHall(WeddingHall weddingHall) {
        return this.weddingHallRepository.addWeddingHall(weddingHall);
    }

    @Override
    public boolean deleteWeddingHall(int id) {
        return this.weddingHallRepository.deleteWeddingHall(id);
    }

    @Override
    public boolean updateWeddingHall(WeddingHall weddingHall) {
        return this.weddingHallRepository.updateWeddingHall(weddingHall);
    }

    @Override
    public List<PriceWeddingTime> listOfBooked(int weddingHallId, Date date) {
        return this.weddingHallRepository.listOfBooked(weddingHallId,date);
    }
}
