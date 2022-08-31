package com.nhom13.repository.impl;

import com.nhom13.pojo.*;
import com.nhom13.repository.ListServiceRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class ListServiceRepositoryImpl implements ListServiceRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public int addListService() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            ListService listService=new ListService();
            listService.setPrice(0);
            int id= (int) session.save(listService);
            return id;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return -1;
    }

    @Override
    public boolean deleteListService(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            ListService ls = session.get(ListService.class, id);
            session.delete(ls);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Service> getListService(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rLS = q.from(ListService.class);
        Root rSD = q.from(ServicesDetail.class);
        Root rS = q.from(Service.class);

        q.where(b.and(
                b.and(
                        b.equal(rLS.get("id"),rSD.get("listServiceId")),
                        b.equal(rS.get("id"),rSD.get("serviceId"))
                ),
                b.equal(rLS.get("id"),id)
        ));
        q.multiselect(rS);
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public ListService getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<ListService> q = b.createQuery(ListService.class);
        Root root = q.from(ListService.class);
        q.select(root);
        q.where(b.equal(root.get("id"), id));

        javax.persistence.Query query = session.createQuery(q);
        return (ListService) query.getSingleResult();
    }
}
