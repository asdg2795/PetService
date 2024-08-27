package com.multi.myapp.controller;

import java.util.List; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.myapp.service.GuestBookService;
import com.multi.myapp.vo.GuestBookVO;


@Controller
@RequestMapping("/GuestBook")
public class GusetBookController {
	@Autowired
	GuestBookService service;

	@PostMapping("/write")
	@ResponseBody
	public int replyWrite(GuestBookVO vo, HttpSession session) {
		vo.setUserid((String) session.getAttribute("logId"));
		System.out.println(vo.toString());
		int result = service.GbookInsert(vo);
		return result;
	}
	@GetMapping("/list")
	@ResponseBody
	public List<GuestBookVO> GbookList(int no){
		List<GuestBookVO> GbookList = service.GBookSelect(no);
		
		return GbookList;
		
	}
	@GetMapping("/delete")
	@ResponseBody
	public String GbookDelete(int replyno) {
		return service.GbookDelete(replyno) + "";
	}

}
