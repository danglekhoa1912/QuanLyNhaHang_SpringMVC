package com.nhom13.repository.impl;

import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.repository.OrderRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
@Repository
@Transactional
public class OrderRepositoryImpl implements OrderRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public WeddingPartyOrders addOrder(WeddingPartyOrders order) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(order);
            return order;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }

        return null;

    }
}
