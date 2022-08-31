package com.nhom13.formatter;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.MenuDish;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class DishFormatter implements Formatter<Dish> {
    @Override
    public Dish parse(String s, Locale locale) throws ParseException {
        Dish dish=new Dish();
        dish.setId(Integer.parseInt(s));
        return dish;
    }

    @Override
    public String print(Dish dish, Locale locale) {
        return String.valueOf(dish.getId());
    }
}
