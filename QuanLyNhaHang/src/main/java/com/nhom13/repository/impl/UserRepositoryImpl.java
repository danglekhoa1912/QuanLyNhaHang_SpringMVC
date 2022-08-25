package com.nhom13.repository.impl;

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
import javax.persistence.criteria.Root;

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
    }

}
