package com.spring.testapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TempController {

    @GetMapping("/")
    public String getHome(){
        return "Maheshmati ki jaiiiii";
    }
    
}
