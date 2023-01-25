package com.spring.testapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TempController {

    @Getapping("/")
    public String getHome(){
        return "aws devops is the best";
    }
    
}
