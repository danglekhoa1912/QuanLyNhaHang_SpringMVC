package com.nhom13.service;

import com.nhom13.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    boolean addUser(User user);
    User getUserByEmail(String email);
    boolean checkEmail(String email);
    boolean checkNumberPhone(String phone);
}
