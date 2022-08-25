package com.nhom13.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nhom13.pojo.User;
import com.nhom13.repository.UserRepository;
import com.nhom13.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;


@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private Cloudinary cloudinary;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public boolean addUser(User user) {
        String pass= user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setRole(User.USER);
        try {

            Map res=this.cloudinary.uploader().upload(user.getImg().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            user.setAvatar(res.get("secure_url").toString());
            return this.userRepository.addUser(user);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
//        return this.userRepository.addUser(user);
    }

    @Override
    public User getUserByEmail(String email) {
        return this.userRepository.getUserByEmail(email);
    }

    @Override
    public boolean checkEmail(String email) {
        return this.userRepository.checkEmail(email);
    }

    @Override
    public boolean checkNumberPhone(String phone) {
        return this.userRepository.checkNumberPhone(phone);
    }


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User u = this.getUserByEmail(email);
        if (u == null) {
            throw new UsernameNotFoundException("Invalid email!!!");
        }

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRole()));

        return new org.springframework.security.core.userdetails.User(
                u.getEmail(), u.getPassword(), authorities);
    }
}
