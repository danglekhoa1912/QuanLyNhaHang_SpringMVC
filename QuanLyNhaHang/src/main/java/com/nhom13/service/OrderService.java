package com.nhom13.service;

import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingPartyOrders;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderService {
    WeddingPartyOrders addOrder(int userId, List<Integer> menu, List<Integer> listService, int weddinghallId, int priceWeddingId, Date orderDate, int amount, String typePay, int quantityTable);
    List<WeddingPartyOrders> getOrder(Map<String, String> params, int page);
    List<WeddingPartyOrders> getOrderByUser(int id);
    int getCountOrder();
}
