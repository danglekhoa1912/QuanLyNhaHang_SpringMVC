package com.nhom13.repository.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.repository.DishRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class DishRepositoryImpl implements DishRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    @Override
    public List<Dish> getDishes(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Dish> q = b.createQuery(Dish.class);
        Root root = q.from(Dish.class);
        q.select(root);

        if(params!=null){
            List<Predicate> predicates = new ArrayList<>();

            //getByCategory
            String cateId = params.get("cateDishId");
            if (cateId != null) {
                Predicate p = b.equal(root.get("categoryId"), Integer.parseInt(cateId));
                predicates.add(p);
            }

            //getByName
            String nameDish=params.get("nameDish");
            System.out.println(nameDish);
            if(nameDish!=null){
                Predicate p=b.equal(root.get("name"),nameDish.replaceAll("%20"," "));
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
    public Dish getDishById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Dish dish;
        dish=session.get(Dish.class,id);
        return dish;
    }

    @Override
    public boolean addDish(Dish dish) {
        Session session=this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(dish);
            return true;
        }
        catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
}
