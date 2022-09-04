package com.nhom13.controllers;

import com.nhom13.pojo.Feedback;
import com.nhom13.pojo.Service;
import com.nhom13.pojo.WeddingPartyOrders;
import com.nhom13.service.DishService;
import com.nhom13.service.OrderService;
import com.nhom13.service.ServiceResService;
import com.nhom13.service.WeddingHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin")
public class ApiAdminController {

    @Autowired
    OrderService orderService;
    @Autowired
    WeddingHallService weddingHallService;
    @Autowired
    DishService dishService;
    @Autowired
    ServiceResService serviceResService;

    @PutMapping(path = "/order/update", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public boolean uppdateStatus(@RequestBody Map<String, String> body) {
        int orderId = Integer.parseInt(body.get("orderId"));
        boolean status = Boolean.parseBoolean(body.get("status"));
        return this.orderService.upateStatusOrder(orderId, status);
    }

    @DeleteMapping(path = "/deleteHall/{id}", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public boolean deleteHall(@PathVariable String id ) {
        int hallId=Integer.parseInt(id);
        return this.weddingHallService.deleteWeddingHall(hallId);
    }

    @DeleteMapping(path = "/deleteDish/{id}", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public boolean deleteDish(@PathVariable String id ) {
        int dishId=Integer.parseInt(id);
        return this.dishService.deleteDish(dishId);
    }

    @RequestMapping("/listOrder")
    public ResponseEntity<List<WeddingPartyOrders>> listOrder() {
        return new ResponseEntity<>(this.orderService.getAllOrder(), HttpStatus.OK);
    @DeleteMapping(path = "/deleteService/{id}", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public boolean deleteService(@PathVariable String id ) {
        int dishId=Integer.parseInt(id);
        return this.serviceResService.deleteService(dishId);
    }
}
