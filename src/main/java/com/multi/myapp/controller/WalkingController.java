package com.multi.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.multi.myapp.service.WalkingService;
import com.multi.myapp.vo.WalkingVO;

@Controller
@RequestMapping("/walking")
public class WalkingController {
	@Autowired
	WalkingService service;
	
	@GetMapping("/WalkingParty")
	public ModelAndView WalkingPartyView(WalkingVO wwvo) {
		ModelAndView mav = new ModelAndView();
		List<WalkingVO> list = service.walkingSelect();
	
		for(WalkingVO vo: list) {
			System.out.println(vo.toString());
		}
		
		mav.addObject("list",list);
		mav.setViewName("walking/WalkingParty");		
		return mav;
		
	}
	@GetMapping("/WalkingPartyRecruit")
	public String WalkingPartyRecruitView(HttpSession session) {
		
		return "walking/WalkingPartyRecruit";
	}
	
	@PostMapping("/WalkingWriteOk")
	public ModelAndView WalkingWriteOk(WalkingVO wVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		 if (session.getAttribute("logStatus") != "Y") {
	            mav.setViewName("sign/login");
	        }
		int result = service.WalkingInsert(wVO);
		if(result>0) {
			mav.setViewName("walking/WalkingResult2");
		}else {
			mav.addObject("msg","등록");
			mav.setViewName("walking/WalkingResult");
		}

		return mav;
	}
	
	@PostMapping("/requestOk")
	public ModelAndView WalkingRequestOk(WalkingVO wVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		 if (session.getAttribute("logStatus") != "Y") {
	          mav.setViewName("sign/login");
	        }
		int result = service.RequestInsert(wVO);
		 if(result>0) {
			 mav.setViewName("home");
		 }else {
			 mav.addObject("msg","신청");
			 mav.setViewName("walking/WalkingResult");
		 }
		return mav;
	}
}	
