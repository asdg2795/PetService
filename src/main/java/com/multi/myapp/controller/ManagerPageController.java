package com.multi.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.multi.myapp.service.ManagerPageService;
import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.ManagerPageVO;

@Controller
@RequestMapping("/managerPage")
public class ManagerPageController {
	@Autowired
	ManagerPageService service;
	
	@GetMapping("/manager")
	public ModelAndView ManagerUserPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		List<ManagerPageVO> userlist = service.userManage();
		List<ManagerPageVO> petlist = service.petManage();
		List<ManagerPageVO> reportlist = service.reportManage();
		List<ManagerPageVO> requestlist = service.requestManage();
		List<ManagerPageVO> reviewlist = service.reviewManage();
		List<ManagerPageVO> boardlist = service.boardManage();
		List<ManagerPageVO> walkinglist = service.walkingManage();
		 if (session.getAttribute("logStatus") != "Y") {
	           mav.setViewName("sign/login");
	           return mav;
	        }
		mav.addObject("walkinglist",walkinglist);
		mav.addObject("boardlist",boardlist);
		mav.addObject("userlist", userlist);
		mav.addObject("petlist", petlist);
		mav.addObject("reportlist", reportlist);
		mav.addObject("requestlist", requestlist);
		mav.addObject("reviewlist", reviewlist);
		mav.setViewName("managerPage/manager");
		return mav;
	}

	 @GetMapping("/UserDel")
	   @ResponseBody
	   public int UserDel(@RequestParam("no") int no, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("no", no);
	       params.put("logId", logId);
	      
	      return service.UserDel(params);
	   }
	 @GetMapping("/PetProfileDel")
	   @ResponseBody
	   public int PetProfileDel(@RequestParam("no") int no, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("no", no);
	       params.put("logId", logId);
	      
	      return service.PetProfileDel(params);
	   }
	   @GetMapping("/PostDel")
	   @ResponseBody
	   public int PostDel(@RequestParam("no") int no, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("no", no);
	       params.put("logId", logId);
	      
	      return service.PostDel(params);
	   }
	 
	 @GetMapping("/courseDel")
	   @ResponseBody
	   public int courseDel(@RequestParam("courseno") int courseno, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("courseno", courseno);
	       params.put("logId", logId);
	      
	      return service.courseDel(params);
	   }
	   
	   @GetMapping("/PartyDel")
	   @ResponseBody
	   public int PartyDel(@RequestParam("no") int no, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("no", no);
	       params.put("logId", logId);
	      
	      return service.PartyDel(params);
	   }
	   
	   @GetMapping("/ReviewDel")
	   @ResponseBody
	   public int ReviewDel(@RequestParam("no") int no, HttpSession session) {
	      String logId = (String)session.getAttribute("logId");
	      Map<String, Object> params = new HashMap<>();
	       params.put("no", no);
	       params.put("logId", logId);
	      
	      return service.ReviewDel(params);
	   }
	
}
