package com.multi.myapp.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

    @GetMapping("/trade/{no}/chat")
    public ModelAndView chatStart(@PathVariable int no) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("chat");
        return mav;
    }

}
