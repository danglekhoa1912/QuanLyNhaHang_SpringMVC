package com.nhom13.repository.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.repository.OrderRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;

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

    @Override
    public List<WeddingPartyOrders> getOrder() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From WeddingPartyOrders ");
        return q.getResultList();
    }

    @Override
    public List<WeddingPartyOrders> getOrderByUser(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<WeddingPartyOrders> q = b.createQuery(WeddingPartyOrders.class);

        Root rW = q.from(WeddingPartyOrders.class);
        q.where(b.equal(rW.get("userId"), id));
        Query query = session.createQuery(q);
        return query.getResultList();
    }
}
