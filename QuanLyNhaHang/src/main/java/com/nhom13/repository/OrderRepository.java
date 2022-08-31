package com.nhom13.repository;

import com.nhom13.pojo.WeddingPartyOrders;

import java.util.Date;

public interface OrderRepository {
    WeddingPartyOrders addOrder(WeddingPartyOrders order);
}
