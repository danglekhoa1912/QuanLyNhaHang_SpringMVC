package com.nhom13.repository;

import com.nhom13.pojo.WeddingHall;

import java.util.List;
import java.util.Map;

public interface WeddingHallRepository {
    List<WeddingHall> getWeddingHalls(Map<String,String> params,int page);
    WeddingHall getWeddingHallById(int id);
    boolean addWeddingHall(WeddingHall weddingHall);
    boolean deleteWeddingHall(int id);
    boolean updateWeddingHall(WeddingHall weddingHall);
}
