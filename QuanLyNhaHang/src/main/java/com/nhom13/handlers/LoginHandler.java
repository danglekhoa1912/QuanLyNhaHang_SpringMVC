package com.nhom13.handlers;

import com.nhom13.pojo.User;
import com.nhom13.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication a) throws IOException, ServletException {
        User u = this.userService.getUserByEmail(a.getName());
        request.getSession().setAttribute("currentUser", u);
        System.out.println(request.getSession().getAttribute("currentUser"));
        response.sendRedirect("/QuanLyNhaHang");
    }
}

