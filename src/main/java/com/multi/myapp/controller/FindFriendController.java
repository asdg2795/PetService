package com.multi.myapp.controller;

import java.util.List;  

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.multi.myapp.service.FindFriendService;
import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.PagingVO;


@Controller
@RequestMapping("/findfriend")
public class FindFriendController {
	@Autowired
	FindFriendService service;
	
	@GetMapping("/list")
	public ModelAndView findfriendList(String userid,PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		FindFriendVO ffvo = service.petlist(userid);		
		List<FindFriendVO> list = service.findFriend();
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		for(FindFriendVO vo : list){
			System.out.println(vo.toString());
		}
		
		mav.addObject("pVO",pVO);
		mav.addObject("list",list);
		mav.setViewName("findfriend/list");
		return mav;
	}
	@GetMapping("/register")
	public String petRegisterView(Model model,FindFriendVO vo, HttpSession session) {
		 if (session.getAttribute("logStatus") != "Y") {
	            return "sign/login";
	        }
		FindFriendVO fvo = service.petid(vo);
		model.addAttribute("fvo",fvo);
	
		return "findfriend/register";
	}
	
	@GetMapping("/pet")
	public ModelAndView findfriendView(PagingVO pVO, int no) {
		ModelAndView mav = new ModelAndView();
		pVO.setTotalRecord(service.totalRecord(pVO));
		FindFriendVO ffvo = service.petprofile(no);	

		List<FindFriendVO> list = service.guestbook(); 		

		mav.addObject("ffvo", ffvo);
		mav.addObject("pVO",pVO);
		mav.addObject("list",list);
		mav.setViewName("findfriend/pet");
		return mav;
		
	}
	
	@PostMapping("/reportWriteOk")
	public ModelAndView findFrinedReportWriteOk(FindFriendVO ffvo) {
		ModelAndView mav = new ModelAndView();
		
		 
		int result = service.reportInsert(ffvo);
		if(result>0) {
			mav.setViewName("redirect:list");
		}else {
			mav.addObject("msg","등록");
			mav.setViewName("findfriend/petResult");
		}
		return mav;
	}
	@PostMapping("/writeOk")
	public ModelAndView findFriendWriteOk(FindFriendVO ffvo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
			
		ffvo.setUserid((String)(request.getSession()).getAttribute("logId"));
		
		int result = service.boardInsert(ffvo);
		if(result>0) {
			mav.setViewName("redirect:pet");
		}else {//등록실패
			mav.addObject("msg","등록");
			mav.setViewName("findfriend/petResult");
		}
		
		return mav;
	}

	
	@PostMapping("/petRegisterWriteOk")
	public ModelAndView petRegisterWriteOk(FindFriendVO ffvo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		ffvo.setUserid((String)(request.getSession()).getAttribute("logId"));
		
		int result = service.petRegisterInsert(ffvo);
		if(result>0) {
			mav.setViewName("redirect:list");
		}else {//등록실패
			mav.addObject("msg","등록");
			mav.setViewName("findfriend/petResult");
		}
		return mav;
	}
	@PostMapping("/requestOk")
	public ModelAndView findfriendRequestOk(FindFriendVO ffvo) {
		ModelAndView mav = new ModelAndView();
		
		int result = service.findfriendRequest(ffvo);
		if(result>0) {
			mav.setViewName("home");
		}else {
			mav.addObject("msg","신청");
			mav.setViewName("findfriend/FriendRequestResult");
		}
		return mav;
	}
	
}


