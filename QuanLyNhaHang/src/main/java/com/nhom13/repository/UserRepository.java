package com.nhom13.repository;

import com.nhom13.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserRepository {
     boolean addUser(User user);
     User getUserByEmail(String email);
     boolean checkEmail(String email);
     boolean checkNumberPhone(String phone);
     User getUserById(int id);
     boolean updateUser(User user);
//     boolean checkPass(String pass);
//     boolean changePass()
     List<User> getUserByRole(Map<String, String> params,int page);
     int countAccount(Map<String, String> params);

}
