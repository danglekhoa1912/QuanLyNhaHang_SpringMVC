package com.nhom13.service.impl;

import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.repository.*;
import com.nhom13.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private WeddingHallRepository weddingHallRepository;
    @Autowired
    private PriceWeddingTimeRepository priceWeddingTimeRepository;
    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private ListServiceRepository listServiceRepository;

    @Override
    public WeddingPartyOrders addOrder(int userId, int menuId, int listServiceId, int weddinghallId, int priceWeddingId, Date orderDate,int amount,String typePay,int quantityTable) {

        WeddingPartyOrders order=new WeddingPartyOrders();
        order.setUserId(this.userRepository.getUserById(userId));
        order.setWhId(this.weddingHallRepository.getWeddingHallById(weddinghallId));
        order.setPwtId(this.priceWeddingTimeRepository.getPriceWeddingById(priceWeddingId));
        order.setOrderDate(orderDate);
        order.setAmount(amount);
        order.setTypePay(typePay);
        order.setQuantityTable(quantityTable);
        order.setPaymentStatus(false);
        order.setMenuId(menuRepository.getMenuById(menuId));
        order.setListServiceId(this.listServiceRepository.getById(listServiceId));
        return this.orderRepository.addOrder(order);
    }
}
