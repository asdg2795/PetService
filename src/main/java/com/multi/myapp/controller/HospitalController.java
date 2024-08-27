package com.multi.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.multi.myapp.service.HospitalService;
import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.HospitalVO;
import com.multi.myapp.vo.PagingVO;

@Controller
@RequestMapping("hospital")
public class HospitalController {
	
	@Autowired
	HospitalService service;
	
	@GetMapping("/view")
	public ModelAndView HospitalView(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		pVO.setTotalRecord(service.totalRecord(pVO));
		List<HospitalVO> list = service.hospitalSelect();
	
		mav.addObject("pVO", pVO);
		mav.addObject("list", list);
		mav.setViewName("hospital/view");
		return mav;
		
	}

	 
	@PostMapping("/reviewWriteOk")
	public ModelAndView reviewWriteOk(HospitalVO hvo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		 if (session.getAttribute("logStatus") != "Y") {
	            mav.setViewName("sign/login");
	        }
		
		int result = service.reviewInsert(hvo);
		if(result>0) {
			mav.setViewName("redirect:view");
		}else {
			mav.addObject("msg","µî·Ï");
			mav.setViewName("hospital/reviewResult");
		}
		
		
		
		return mav;
	}
	
	 @GetMapping("/Del")
	   @ResponseBody
	   public int Del(@RequestParam("no") int no, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("no", no);
	       params.put("logId", logId);
	      
	      return service.Del(params);
	   }
	
	@GetMapping("/review")
	public ModelAndView reviewPage() {
		ModelAndView mav = new ModelAndView();
		List<HospitalVO> hhlist = service.reviewSelect();
		
		mav.addObject("hhlist",hhlist);
		mav.setViewName("hospital/review");
		return mav;
	}

}