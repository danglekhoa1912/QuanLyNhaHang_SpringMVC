package com.nhom13.service;

import com.nhom13.pojo.User;
import com.nhom13.pojo.WeddingPartyOrders;

import java.util.Date;

public interface OrderService {
    WeddingPartyOrders addOrder(int userId, int menuId, int listServiceId, int weddinghallId, int priceWeddingId, Date orderDate, int amount, String typePay, int quantityTable);
}
