package com.nhom13.formatter;

import com.nhom13.pojo.User;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class UserFormatter implements Formatter<User> {
    @Override
    public User parse(String s, Locale locale) throws ParseException {
        User user=new User();
        user.setId(Integer.parseInt(s));
        return user;
    }

    @Override
    public String print(User user, Locale locale) {
        return String.valueOf(user.getId());
    }
}
