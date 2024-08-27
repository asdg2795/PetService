package com.multi.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.myapp.service.BoardReplyService;
import com.multi.myapp.vo.BoardReplyVO;

@Controller
@RequestMapping("/boardReply")
public class BoardReplyController {
	
	@Autowired
	BoardReplyService service;
	
	// ��� ���
	@PostMapping("/write")
	@ResponseBody
	public String replyWrite(BoardReplyVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		 if (session.getAttribute("logStatus") != "Y") {
	            return "sign/login";
	        }
		int result = service.replyInsert(vo);
		
		return result+"";
	}
	
	// ��� ���
	@GetMapping("/list")
	@ResponseBody
	public List<BoardReplyVO> replyList(int no, HttpSession session) {
		List<BoardReplyVO> replyList = service.replySelect(no);
		
		return replyList;
	}
	
	// ��� ����(DB)
	@PostMapping("/editOk")
	@ResponseBody
	public String replyEditOk(BoardReplyVO vo, HttpSession session) {
		 if (session.getAttribute("logStatus") != "Y") {
	            return "sign/login";
	        }
		return service.replyUpdate(vo) + "";
	}
	
	// ��� ����
	@GetMapping("/delete")
	@ResponseBody
	public String replyDelete(int replyno, HttpSession session) {
		 if (session.getAttribute("logStatus") != "Y") {
	            return "sign/login";
	        }
		return service.replyDelete(replyno) + "";
	}
}
