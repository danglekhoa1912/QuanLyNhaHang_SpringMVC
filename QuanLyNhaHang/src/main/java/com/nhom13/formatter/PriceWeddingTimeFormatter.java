package com.nhom13.formatter;

import com.nhom13.pojo.PriceWeddingTime;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class PriceWeddingTimeFormatter implements Formatter<PriceWeddingTime> {
    @Override
    public PriceWeddingTime parse(String s, Locale locale) throws ParseException {
        PriceWeddingTime priceWeddingTime=new PriceWeddingTime();
        priceWeddingTime.setId(Integer.parseInt(s));
        return priceWeddingTime;
    }

    @Override
    public String print(PriceWeddingTime priceWeddingTime, Locale locale) {
        return String.valueOf(priceWeddingTime.getId());
    }
}
