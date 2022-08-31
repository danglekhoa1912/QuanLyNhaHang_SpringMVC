package com.nhom13.repository;

import com.nhom13.pojo.PriceWeddingTime;

import java.util.List;

public interface PriceWeddingTimeRepository {
    PriceWeddingTime getPriceWeddingById(int id);
    List<PriceWeddingTime> getAllPriceWedding();
}
