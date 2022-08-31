package com.nhom13.formatter;

import com.nhom13.pojo.Service;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class ServiceFormatter implements Formatter<Service> {
    @Override
    public Service parse(String s, Locale locale) throws ParseException {
        Service service= new Service();
        service.setId(Integer.parseInt(s));
        return service;
    }

    @Override
    public String print(Service service, Locale locale) {
        return String.valueOf(service.getId());
    }
}
