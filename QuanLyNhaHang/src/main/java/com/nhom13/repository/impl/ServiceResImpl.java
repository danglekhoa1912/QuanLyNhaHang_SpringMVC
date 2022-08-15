package com.nhom13.repository.impl;

import com.nhom13.pojo.Dish;
import com.nhom13.pojo.Service;
import com.nhom13.repository.ServiceResRepository;
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
public class ServiceResImpl implements ServiceResRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<Service> getServicesRes(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Service> q = b.createQuery(Service.class);
        Root root = q.from(Service.class);
        q.select(root);

        if(params!=null){
            List<Predicate> predicates=new ArrayList<>();

            //get by mame
            String nameService=params.get("name");
            if(nameService!=null){
                Predicate p=b.or(b.like(root.get("name"),"% "+nameService),b.like(root.get("name"),nameService+"%"),b.like(root.get("name"),"% "+nameService+" %"));
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
