package com.nhom13.repository.impl;

import com.nhom13.pojo.*;
import com.nhom13.repository.ServiceDetailRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ServiceDetailRepositoryImpl implements ServiceDetailRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addServiceToList(int listServiceId, List<Integer> listService) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            ListService list = session.get(ListService.class, listServiceId);

            int total=0;
            for(int i=0;i<listService.size();i++){
                ServicesDetail servicesDetail=new ServicesDetail();
                servicesDetail.setServiceId(new Service(listService.get(i)));
                servicesDetail.setListServiceId(list);
                session.save(servicesDetail);

                Service service = session.get(Service.class, listService.get(i));
                total+=service.getPrice();
            }
            list.setPrice(total);
            session.update(list);
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
}
