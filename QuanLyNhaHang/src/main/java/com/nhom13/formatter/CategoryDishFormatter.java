package com.nhom13.formatter;

import com.nhom13.pojo.CategoryDish;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class CategoryDishFormatter implements Formatter<CategoryDish> {
    @Override
    public CategoryDish parse(String s, Locale locale) throws ParseException {
        CategoryDish categoryDish=new CategoryDish();
        categoryDish.setId(Integer.parseInt(s));
        return categoryDish;
    }

    @Override
    public String print(CategoryDish categoryDish, Locale locale) {
        return String.valueOf(categoryDish.getId());
    }
}
