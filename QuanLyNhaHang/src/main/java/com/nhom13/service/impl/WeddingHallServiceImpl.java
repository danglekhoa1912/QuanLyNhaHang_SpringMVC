package com.nhom13.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nhom13.pojo.PriceWeddingTime;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.repository.WeddingHallRepository;
import com.nhom13.service.WeddingHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class WeddingHallServiceImpl implements WeddingHallService {

    @Autowired(required = false)
    private Cloudinary cloudinary;

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
        try {

            Map res = this.cloudinary.uploader().upload(weddingHall.getImg().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            weddingHall.setImage(res.get("secure_url").toString());
            return this.weddingHallRepository.addWeddingHall(weddingHall);

        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
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
