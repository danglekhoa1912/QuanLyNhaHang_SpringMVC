package com.nhom13.service.impl;

import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingHall;
import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.repository.*;
import com.nhom13.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
    public WeddingPartyOrders addOrder(int userId, List<Integer> menu,  List<Integer>  listService, int weddinghallId, int priceWeddingId, Date orderDate,int amount,String typePay,int quantityTable) {

        WeddingPartyOrders order=new WeddingPartyOrders();
        order.setUserId(this.userRepository.getUserById(userId));
        order.setWhId(this.weddingHallRepository.getWeddingHallById(weddinghallId));
        order.setPwtId(this.priceWeddingTimeRepository.getPriceWeddingById(priceWeddingId));
        order.setOrderDate(orderDate);
        order.setAmount(amount);
        order.setTypePay(typePay);
        order.setQuantityTable(quantityTable);
        order.setPaymentStatus(false);
        order.setMenuId(this.menuRepository.addMenu(menu));
        order.setListServiceId(this.listServiceRepository.addListService(listService));
        return this.orderRepository.addOrder(order);
    }

    @Override
    public List<WeddingPartyOrders> getOrder(Map<String, String> params, int page) {
        return this.orderRepository.getOrder(params,page);
    }

    @Override
    public List<WeddingPartyOrders> getOrderByUser(int id) {
        return this.orderRepository.getOrderByUser(id);
    }
    @Override
    public int getCountOrder(){return this.orderRepository.countOrder();}

    @Override
    public WeddingPartyOrders getOrderById(int id) {
        return this.orderRepository.getOrderById(id);
    }

    @Override
    public boolean upateStatusOrder(int orderId, boolean status) {
        WeddingPartyOrders order=this.getOrderById(orderId);
        order.setPaymentStatus(status);
        return this.orderRepository.updateStatusOrder(order);
    }
}
