package com.nhom13.controllers;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;

@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class weddingHallController {

}
