package com.nhom13.repository.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.Menu;
import com.nhom13.pojo.MenuDish;
import com.nhom13.repository.MenuDishRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class MenuDishRepositoryImpl implements MenuDishRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addDishToMenu(int menuId, List<Integer> listDish) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Menu menu = session.get(Menu.class, menuId);

            int total=0;
            for(int i=0;i<listDish.size();i++){
                MenuDish menuDish=new MenuDish();
                menuDish.setDishId(new Dish(listDish.get(i)));
                menuDish.setMenuId(menu);
                session.save(menuDish);

                Dish dish = session.get(Dish.class, listDish.get(i));
                total+=dish.getPrice();
            }
            menu.setPrice(total);
            session.update(menu);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
}
