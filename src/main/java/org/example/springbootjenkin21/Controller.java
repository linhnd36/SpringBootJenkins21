package org.example.springbootjenkin21;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String helloword() {
        return "Hello World";
    }

    @GetMapping("/1")
    public String helloword1() {
        return "Hello World1";
    }


//    sss
}
