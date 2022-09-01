package com.nhom13.service;

import com.nhom13.pojo.PriceWeddingTime;
import com.nhom13.pojo.WeddingHall;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface WeddingHallService {
    List<WeddingHall> getWeddingHalls(Map<String,String> params, int page);
    WeddingHall getWeddingHallById(int id);
    boolean addWeddingHall(WeddingHall weddingHall);
    boolean deleteWeddingHall(int id);
    boolean updateWeddingHall(WeddingHall weddingHall);
    List<PriceWeddingTime> listOfBooked(int weddingHallId, Date date);
}
