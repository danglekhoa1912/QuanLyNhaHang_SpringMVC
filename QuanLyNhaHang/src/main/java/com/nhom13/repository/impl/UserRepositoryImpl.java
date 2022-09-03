package com.nhom13.repository.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.User;
import com.nhom13.repository.UserRepository;
import org.hibernate.HibernateException;
import org.springframework.core.env.Environment;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import org.hibernate.query.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public boolean addUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public User getUserByEmail(String email) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);
        q.where(b.equal(root.get("email"), email));

        Query query = session.createQuery(q);
        System.out.println(query.getSingleResult());
        return (User) query.getSingleResult();
    }

    @Override
    public boolean checkEmail(String email) {
        try{
            Session session = this.sessionFactory.getObject().getCurrentSession();
            CriteriaBuilder b = session.getCriteriaBuilder();
            CriteriaQuery<User> q = b.createQuery(User.class);
            Root root = q.from(User.class);
            q.select(root);

            q.where(b.equal(root.get("email"), email));
            Query query = session.createQuery(q);
            return query.getSingleResult()==null;
        }catch (NoResultException e){
            System.out.println(e.getMessage());
            return true;
        }
        catch (HibernateException ex){
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean checkNumberPhone(String phone) {
        try{
            Session session = this.sessionFactory.getObject().getCurrentSession();
            CriteriaBuilder b = session.getCriteriaBuilder();
            CriteriaQuery<User> q = b.createQuery(User.class);
            Root root = q.from(User.class);
            q.select(root);

            q.where(b.equal(root.get("mobile"), phone));
            Query query = session.createQuery(q);
            return query.getSingleResult()==null;
        }
        catch (NoResultException e){
            System.out.println(e.getMessage());
            return true;
        }
        catch (HibernateException ex){
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);
        q.where(b.equal(root.get("id"), id));

        Query query = session.createQuery(q);
        return (User) query.getSingleResult();
    }

    @Override
    public boolean updateUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.update(user);
            return true;
        }catch (HibernateException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<User> getUserByRole(Map<String, String> params,int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String name = params.get("name");
            if (name != null && !name.isEmpty()) {
                Predicate p=b.or(b.like(root.get("name").as(String.class), "%" + name.trim() + "%"));
                predicates.add(p);
            }

            String role = params.get("role");
            if (role != null) {
                Predicate p = b.equal(root.get("role"), role);
                predicates.add(p);
            }

            q.where(predicates.toArray(new Predicate[]{}));
        }
        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }
    @Override
    public int countAccount(Map<String, String> params){
        String name=params.get("role");
        if (name!=null){
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Query q = session.createQuery("SELECT COUNT(*) FROM User where role='ROLE_USER'");
            if (name.equals("ROLE_USER")){
                q = session.createQuery("SELECT COUNT(*) FROM User where role='ROLE_USER'");
            }
            if (name.equals("ROLE_STAFF")){
                q = session.createQuery("SELECT COUNT(*) FROM User where role='ROLE_STAFF'");
            }

            return Integer.parseInt(q.getSingleResult().toString());
        }
        return 0;
    }
}
