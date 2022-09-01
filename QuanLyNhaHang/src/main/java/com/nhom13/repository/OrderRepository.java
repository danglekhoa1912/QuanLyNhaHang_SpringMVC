package com.nhom13.repository;

import com.nhom13.pojo.WeddingPartyOrders;

import java.util.Date;
import java.util.List;

public interface OrderRepository {
    WeddingPartyOrders addOrder(WeddingPartyOrders order);
    List<WeddingPartyOrders> getOrder();
    List<WeddingPartyOrders> getOrderByUser(int id);
}
