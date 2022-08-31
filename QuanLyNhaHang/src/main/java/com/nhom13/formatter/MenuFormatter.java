package com.nhom13.formatter;

import com.nhom13.pojo.Menu;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class MenuFormatter implements Formatter<Menu> {
    @Override
    public Menu parse(String s, Locale locale) throws ParseException {
        Menu menu=new Menu();
        menu.setId(Integer.parseInt(s));
        return menu;
    }

    @Override
    public String print(Menu menu, Locale locale) {
        return String.valueOf(menu.getId());
    }
}
