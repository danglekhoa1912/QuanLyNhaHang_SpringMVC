package com.nhom13.repository.impl;

import com.nhom13.pojo.*;
import com.nhom13.repository.MenuDishRepository;
import com.nhom13.repository.MenuRepository;
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
public class MenuRepositoryImpl implements MenuRepository {

    @Autowired
    private MenuDishRepository menuDishRepository;

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Menu addMenu(List<Integer> dish) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Menu menu=new Menu();
            menu.setPrice(0);
            int id= (int) session.save(menu);
            menuDishRepository.addDishToMenu(id,dish);
            return menu;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }

        return null;
    }

    @Override
    public boolean deleteMenu(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Menu m = session.get(Menu.class, id);
            session.delete(m);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Dish> getListDish(int menuId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rM = q.from(Menu.class);
        Root rMD = q.from(MenuDish.class);
        Root rD = q.from(Dish.class);

        q.where(b.and(
                b.and(
                        b.equal(rM.get("id"),rMD.get("menuId")),
                        b.equal(rD.get("id"),rMD.get("dishId"))
                ),
                b.equal(rM.get("id"),menuId)
        ));
        q.multiselect(rD);
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Menu getMenuById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Menu> q = b.createQuery(Menu.class);
        Root root = q.from(Menu.class);
        q.select(root);
        q.where(b.equal(root.get("id"), id));

        javax.persistence.Query query = session.createQuery(q);
        return (Menu) query.getSingleResult();
    }

}
