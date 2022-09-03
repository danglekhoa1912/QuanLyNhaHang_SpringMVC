package com.nhom13.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mservice.enums.RequestType;
import com.mservice.models.PaymentResponse;
import com.mservice.processor.CreateOrderMoMo;
import com.nhom13.Utils;
import com.nhom13.pojo.*;
import com.nhom13.service.*;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiDishController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private DishService dishService;
    @Autowired
    private ServiceResService serviceResService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private WeddingHallService weddingHallService;

    @Autowired
    private PriceWeddingTimeService priceWeddingTimeService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private UserService userService;


    @Autowired
    private ListServiceResService listServiceResService;

    @RequestMapping("/menu")
    public ResponseEntity<List<Dish>> listDishByMenuId( @RequestParam(value = "id") int id) {
        return new ResponseEntity<>(this.menuService.getListDish(id), HttpStatus.OK);
    }

    @RequestMapping("/orderService")
    public ResponseEntity<List<Service>> listOrderService( @RequestParam(value = "id") int id) {
        return new ResponseEntity<>(this.listServiceResService.getListService(id), HttpStatus.OK);
    }

    @RequestMapping("/dishes")
    public ResponseEntity<List<Dish>> listDish(@RequestParam(value = "categoryId") String categoryId, @RequestParam(value = "page") int page) {
        return new ResponseEntity<>(this.dishService.getDishes(null, categoryId, page), HttpStatus.OK);
    }

    @RequestMapping("/service")
    public ResponseEntity<List<Service>> listService( @RequestParam(value = "page") int page) {
        return new ResponseEntity<>(this.serviceResService.getServicesRes(null, page), HttpStatus.OK);
    }

    @GetMapping(path = "/getPriceWeddingTime/{id}", produces = "application/json")
    public ResponseEntity<Object> getPrice( @PathVariable int id){
        return new ResponseEntity<>(this.priceWeddingTimeService.getPriceWeddingById(id), HttpStatus.OK);
    }

    @RequestMapping("/listOfBooked")
    public ResponseEntity<List<PriceWeddingTime>> listOfBooked( @RequestParam(value = "weddingHallId") int weddingHallId,@RequestParam(value = "date") String date) throws ParseException {
        Date orderDate= new SimpleDateFormat("yyyy-MM-dd").parse(date);
        return new ResponseEntity<>(this.weddingHallService.listOfBooked(weddingHallId, orderDate), HttpStatus.OK);
    }

    @PostMapping(path="/receipt",consumes = "application/json", produces = "application/json")
    public ResponseEntity<WeddingPartyOrders> createOrder(@Valid @RequestBody Map<String, Object> params, HttpSession session) {
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

    @PostMapping(path="/payment",consumes = "application/json", produces = "application/json")
    public ResponseEntity<PaymentResponse> payment(@RequestBody Map<String, Object> data, HttpServletRequest request) throws Exception{
        ObjectMapper mapper = new ObjectMapper();
        WeddingPartyOrders order=mapper.convertValue(data, WeddingPartyOrders.class);
        String orderInfor="Hóa đơn tiệc cưới";
        String successUrl = Utils.getBaseURL(request) + "/" ;
        String requestId = String.valueOf(System.currentTimeMillis());
        if(order.getTypePay().equals("momo")){
            com.mservice.config.Environment environment = com.mservice.config.Environment.selectEnv("dev");
            PaymentResponse captureWalletMoMoResponse = CreateOrderMoMo.process(environment, order.getId().toString(), order.getId().toString(), Integer.toString(order.getAmount()) , orderInfor, successUrl, successUrl, "", RequestType.CAPTURE_WALLET, Boolean.TRUE);
            return new ResponseEntity<>(captureWalletMoMoResponse, HttpStatus.OK);
        }
        if(order.getTypePay().equals("momo-card")){
            com.mservice.config.Environment environment = com.mservice.config.Environment.selectEnv("dev");
            PaymentResponse captureATMMoMoResponse = CreateOrderMoMo.process(environment, order.getId().toString(), requestId, Integer.toString(order.getAmount()), orderInfor, successUrl, successUrl, "", RequestType.PAY_WITH_ATM, null);
            return new ResponseEntity<>(captureATMMoMoResponse, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/feedback", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Feedback> addComment(@RequestBody Map<String, String> params) {
        String content = params.get("content");
        Feedback f = this.feedbackService.addFeedback(content);

        return new ResponseEntity<>(f, HttpStatus.CREATED);
    }

    @PostMapping(path = "/changepass", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Boolean> changePass(@RequestBody Map<String,String> body) {
        String pass=body.get("pass");
        int userId=Integer.parseInt(body.get("userId"));

        return new ResponseEntity<>(this.userService.updatePass(pass,userId), HttpStatus.OK);
    }

}
