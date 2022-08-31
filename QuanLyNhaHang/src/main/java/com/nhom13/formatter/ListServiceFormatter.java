package com.nhom13.formatter;

import com.nhom13.pojo.ListService;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class ListServiceFormatter implements Formatter<ListService> {
    @Override
    public ListService parse(String s, Locale locale) throws ParseException {
        ListService listService=new ListService();
        listService.setId(Integer.parseInt(s));
        return listService;
    }

    @Override
    public String print(ListService listService, Locale locale) {
        return String.valueOf(listService.getId());
    }
}
