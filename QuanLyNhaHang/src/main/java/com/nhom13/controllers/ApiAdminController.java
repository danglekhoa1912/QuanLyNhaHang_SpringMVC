package com.nhom13.controllers;

import com.nhom13.pojo.Service;
import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class ApiAdminController {

    @Autowired
    OrderService orderService;

    /*@RequestMapping("/listOrder")
    public ResponseEntity<List<WeddingPartyOrders>> listOrder() {
        return new ResponseEntity<>(this.orderService.getOrder(), HttpStatus.OK);
    }*/
}
