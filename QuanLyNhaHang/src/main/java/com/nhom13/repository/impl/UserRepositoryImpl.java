package com.nhom13.repository.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.User;
import com.nhom13.repository.UserRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
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
    public List<User> getUserByRole(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String name = params.get("name");
            if (name != null && !name.isEmpty()) {
                Predicate p = b.equal(root.get("name"), name.replaceAll("%20", " "));
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

        return query.getResultList();
    }

}
