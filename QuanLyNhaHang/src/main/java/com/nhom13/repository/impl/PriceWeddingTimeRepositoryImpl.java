package com.nhom13.repository.impl;

import com.nhom13.pojo.PriceWeddingTime;
import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.repository.PriceWeddingTimeRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class PriceWeddingTimeRepositoryImpl implements PriceWeddingTimeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public PriceWeddingTime getPriceWeddingById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<PriceWeddingTime> q = b.createQuery(PriceWeddingTime.class);
        Root root = q.from(PriceWeddingTime.class);
        q.select(root);
        q.where(b.equal(root.get("id"), id));

        javax.persistence.Query query = session.createQuery(q);
        return (PriceWeddingTime) query.getSingleResult();
    }

    @Override
    public List<PriceWeddingTime> getAllPriceWedding() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From PriceWeddingTime ");
        return q.getResultList();
    }
}
