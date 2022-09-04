package com.nhom13.validator;

import com.nhom13.pojo.WeddingHall;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class HallValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return WeddingHall.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        WeddingHall weddingHall=(WeddingHall) o;
        ValidationUtils.rejectIfEmpty(errors,"name","wedding.hall.name.empty");
        ValidationUtils.rejectIfEmpty(errors,"price","wedding.hall.price.empty");
        ValidationUtils.rejectIfEmpty(errors,"capacity","wedding.hall.capacity.empty");
        ValidationUtils.rejectIfEmpty(errors,"img","wedding.hall.image.empty");

        if(weddingHall.getName().matches("[^A-Za-z0-9]")){
            errors.rejectValue("name","wedding.hall.name.invalid");
        }
        if(weddingHall.getPrice()>10000){
            errors.rejectValue("price","wedding.hall.price.max");
        }
        else if(weddingHall.getPrice()<1000){
            errors.rejectValue("price","wedding.hall.price.min");
        }
        if(weddingHall.getCapacity()>50){
            errors.rejectValue("capacity","wedding.hall.capacity.max");
        }
        else if(weddingHall.getCapacity()<10){
            errors.rejectValue("capacity","wedding.hall.capacity.min");
        }
    }
}
