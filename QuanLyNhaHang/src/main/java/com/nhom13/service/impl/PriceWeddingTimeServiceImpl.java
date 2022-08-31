package com.nhom13.service.impl;

import com.nhom13.pojo.PriceWeddingTime;
import com.nhom13.repository.PriceWeddingTimeRepository;
import com.nhom13.service.PriceWeddingTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PriceWeddingTimeServiceImpl implements PriceWeddingTimeService {

    @Autowired
    PriceWeddingTimeRepository priceWeddingTimeRepository;

    @Override
    public PriceWeddingTime getPriceWeddingById(int id) {
        return this.priceWeddingTimeRepository.getPriceWeddingById(id);
    }

    @Override
    public List<PriceWeddingTime> getAllPriceWedding() {
        return this.priceWeddingTimeRepository.getAllPriceWedding();
    }
}
