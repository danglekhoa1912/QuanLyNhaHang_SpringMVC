package com.nhom13.service;

import com.nhom13.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Map;

public interface UserService extends UserDetailsService {
    boolean addUser(User user);
    boolean addStaff(User user);
    User getUserByEmail(String email);
    boolean checkEmail(String email);
    boolean checkNumberPhone(String phone);
    User getUserById(int id);
    boolean updateUser(User user);
    boolean updatePass(String pass,int userId);
    List<User> getUserByRole(Map<String, String> params);
}
