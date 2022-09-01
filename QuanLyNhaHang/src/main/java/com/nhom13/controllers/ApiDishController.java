package com.nhom13.controllers;

import com.nhom13.pojo.*;
import com.nhom13.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.rmi.ServerException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiDishController {

    @Autowired
    private DishService dishService;
    @Autowired
    private ServiceResService serviceResService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private MenuDishService menuDishService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private WeddingHallService weddingHallService;

    @RequestMapping("/dishes")
    public ResponseEntity<List<Dish>> listDish(@RequestParam(value = "categoryId") String categoryId, @RequestParam(value = "page") int page) {
        return new ResponseEntity<>(this.dishService.getDishes(null, categoryId, page), HttpStatus.OK);
    }

    @RequestMapping("/service")
    public ResponseEntity<List<Service>> listService( @RequestParam(value = "page") int page) {
        return new ResponseEntity<>(this.serviceResService.getServicesRes(null, page), HttpStatus.OK);
    }

    @RequestMapping("/listOfBooked")
    public ResponseEntity<List<PriceWeddingTime>> listOfBooked( @RequestParam(value = "weddingHallId") int weddingHallId,@RequestParam(value = "date") Date date) {
        return new ResponseEntity<>(this.weddingHallService.listOfBooked(weddingHallId, date), HttpStatus.OK);
    }

    @PostMapping(path="/receipt",consumes = "application/json", produces = "application/json")
    public ResponseEntity<WeddingPartyOrders> createOrder(@RequestBody Map<String, Object> params,HttpSession session) {
        try{
            User user = (User) session.getAttribute("currentUser");
            int userId=user.getId();
            List<Integer> menu= (List<Integer>) params.get("menu");
            List<Integer> listService= (List<Integer>) params.get("listService");
            int weddinghallId= Integer.parseInt(params.get("weddinghallId").toString());
            int priceWeddingId= Integer.parseInt(params.get("priceWeddingId").toString());
            Date orderDate= new SimpleDateFormat("yyyy-MM-dd").parse(params.get("orderDate").toString());
            int amount= Integer.parseInt(params.get("amount").toString());
            String typePay=params.get("typePay").toString();
            int quantityTable=Integer.parseInt(params.get("quantityTable").toString());
            WeddingPartyOrders order= this.orderService.addOrder(userId,menu,listService,weddinghallId,priceWeddingId,orderDate,amount,typePay,quantityTable);
            return new ResponseEntity<>(order, HttpStatus.CREATED);
        }catch (Exception e){
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
