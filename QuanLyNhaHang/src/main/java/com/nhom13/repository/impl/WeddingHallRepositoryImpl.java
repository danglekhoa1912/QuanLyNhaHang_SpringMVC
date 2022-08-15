package com.nhom13.repository.impl;

import com.nhom13.pojo.Service;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.repository.WeddingHallRepository;
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
public class WeddingHallRepositoryImpl implements WeddingHallRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<WeddingHall> getWeddingHalls(Map<String, String> params, int page) {
        Session session =this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b=session.getCriteriaBuilder();
        CriteriaQuery<WeddingHall> q=b.createQuery(WeddingHall.class);
        Root root = q.from(WeddingHall.class);
        q.select(root);

        if(params!=null){
            List<Predicate> predicates = new ArrayList<>();
            String capacity=params.get("capacity");
            if(capacity!=null){
                Predicate p=b.equal(root.get("capacity"),Integer.parseInt(capacity));
                predicates.add(p);
            }
            String fromPrice=params.get("fromPrice");
            if(fromPrice!=null){
                Predicate p=b.greaterThanOrEqualTo(root.get("price"),Integer.parseInt(fromPrice));
                predicates.add(p);
            }
            String toPrice=params.get("toPrice");
            if(toPrice!=null){
                Predicate p=b.lessThanOrEqualTo(root.get("price"),Integer.parseInt(toPrice));
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
}
