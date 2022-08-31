package com.nhom13.service;

import com.nhom13.pojo.PriceWeddingTime;

import java.util.List;

public interface PriceWeddingTimeService {
    PriceWeddingTime getPriceWeddingById(int id);
    List<PriceWeddingTime> getAllPriceWedding();
}
