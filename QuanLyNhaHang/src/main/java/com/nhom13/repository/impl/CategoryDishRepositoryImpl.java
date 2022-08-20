package com.nhom13.repository.impl;

import com.nhom13.pojo.CategoryDish;
import com.nhom13.repository.CategoryDishRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class CategoryDishRepositoryImpl implements CategoryDishRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;


    @Override
    public List<CategoryDish> getCategoryDish() {
        Session session=this.sessionFactory.getObject().getCurrentSession();
        Query q=session.createQuery("from CategoryDish ");
        return q.getResultList();
    }
}
