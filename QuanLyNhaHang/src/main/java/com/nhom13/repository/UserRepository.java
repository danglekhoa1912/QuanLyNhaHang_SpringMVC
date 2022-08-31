package com.nhom13.repository;

import com.nhom13.pojo.User;

public interface UserRepository {
     boolean addUser(User user);
     User getUserByEmail(String email);
     boolean checkEmail(String email);
     boolean checkNumberPhone(String phone);
     User getUserById(int id);
     boolean updateUser(User user);
//     boolean checkPass(String pass);
//     boolean changePass()
}
