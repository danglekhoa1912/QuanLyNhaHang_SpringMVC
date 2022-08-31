package com.nhom13.formatter;

import com.nhom13.pojo.WeddingHall;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class WeddingHallFormatter implements Formatter<WeddingHall> {
    @Override
    public WeddingHall parse(String s, Locale locale) throws ParseException {
        WeddingHall weddingHall=new WeddingHall();
        weddingHall.setId(Integer.parseInt(s));
        return weddingHall;
    }

    @Override
    public String print(WeddingHall weddingHall, Locale locale) {
        return String.valueOf(weddingHall.getId());
    }
}
