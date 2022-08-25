package com.nhom13.validator;

import com.nhom13.pojo.User;
import com.nhom13.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {

    @Autowired
    UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user=(User) o;
        //Check Email
        Pattern pattern=Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(user.getEmail());
        if(user.getEmail().isEmpty()){
            errors.rejectValue("email","user.email.error.empty");
        }
        else if(!matcher.find()){
            errors.rejectValue("email","user.email.error");
        }
        else if(!userService.checkEmail(user.getEmail())){
            errors.rejectValue("email","user.email.error.alreadyExists");
        }
        //Check pass
        if(user.getPassword().isEmpty()){
            errors.rejectValue("password","user.password.error.empty");
        }
        else if(user.getPassword().length()<8){
            errors.rejectValue("password","user.password.error.length");
        }else if(!user.getPassword().matches("(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$!~/?,<>%^&+=])(?=\\S+$).{8,}")){
            errors.rejectValue("password","user.password.error.invalid");
        }

        //check confirm pass
        else if(!user.getPassword().equals(user.getConfirmPassword())){
            errors.rejectValue("confirmPassword","user.confirmPassword.error.notequal");
        }

        //Check birthday
        LocalDate date = LocalDate.now();
        Calendar calendar = new GregorianCalendar();
        if(user.getBirthday()!=null){
            calendar.setTime(user.getBirthday());
            if(calendar.get(Calendar.YEAR)>date.getYear()-18){
                errors.rejectValue("birthday","user.birthday.error.age");
            }
        }
        else {
            errors.rejectValue("birthday","user.birthday.error.empty");
        }
        //check mobile
        if(user.getMobile().length()<10){
            errors.rejectValue("mobile","user.mobile.error.length");
        }
        else if(!userService.checkNumberPhone(user.getMobile())){
            errors.rejectValue("mobile","user.mobile.error.alreadyExists");
        }
        //check name
        if(user.getName().isEmpty()){
            errors.rejectValue("name","user.name.error.empty");
        }
        else if(user.getName().matches("[^A-Za-z0-9]")){
            errors.rejectValue("name","user.name.error");
        }
        //check file
        if(user.getImg().isEmpty()){
            errors.rejectValue("img","user.avatar.error.empty");
        }
    }
}
