package com.nhom13.repository;

import com.nhom13.pojo.WeddingPartyOrders;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderRepository {
    WeddingPartyOrders addOrder(WeddingPartyOrders order);
    List<WeddingPartyOrders> getOrder(Map<String, String> params, int page);
    List<WeddingPartyOrders> getOrderByUser(int id);
    int countOrder();
    WeddingPartyOrders getOrderById(int id);
    boolean updateStatusOrder(WeddingPartyOrders order);
}
