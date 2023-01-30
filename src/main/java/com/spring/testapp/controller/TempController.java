package com.spring.testapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TempController {

    @GetMapping("/")
    public String getHome(){
<<<<<<< HEAD
        return "aws devops is the best V2";
=======
        return "dev website - updatedV4";
>>>>>>> dev
    }
    
}
