package com.multi.myapp.controller;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.multi.myapp.service.BoardService;
import com.multi.myapp.vo.BoardVO;
import com.multi.myapp.vo.PagingVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	// �Խ���
	@GetMapping("/boardList")
	public ModelAndView boardList(PagingVO pVO) {
		System.out.println(123);
		ModelAndView mav = new ModelAndView();
		// �� ���ڵ� ��
		pVO.setTotalRecord(service.totalRecord(pVO));
		// DB����(page, �˻�)
		List<BoardVO> list = service.boardPageList(pVO);
		mav.addObject("pVO", pVO);
		mav.addObject("list", list);
		mav.setViewName("board/boardList");
		return mav;
	}
	
	// �۾�����
	@GetMapping("/write")
	public String boardWrite(HttpSession session) {
		 if (session.getAttribute("logStatus") != "Y") {
	            return "sign/login";
	        }
		return "board/boardWrite";
	}
	
	// �� ���(DB)
	@PostMapping("/writeOk")
	public ModelAndView boardWriteOk(BoardVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// subject, content -> vo�� request
		// request -> session
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		
		/////////////////////////
		int result = service.boardInsert(vo);
		if(result > 0) {		// �� ���
			mav.setViewName("redirect:boardList");
		} else {		// ��� ����
			mav.addObject("msg", "���");
			mav.setViewName("board/boardResult");	
		}
		return mav;
	}
	
	// �� ���뺸��
	@GetMapping("/view")
	public ModelAndView boardView(int no, PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
				
		service.hitCount(no);	// ��ȸ�� ����
		BoardVO vo = service.boardSelect(no);	// ���ڵ� ����
		
		mav.addObject("vo", vo);
		mav.addObject("pVO", pVO);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	
	// �� ���� ��
	@GetMapping("/edit")
	public ModelAndView boardEdit(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.boardSelect(no));
		mav.setViewName("board/boardEdit");
		
		return mav;
	}
	
	// �� ����(DB)
	@PostMapping("/editOk")
	public ModelAndView boardEditOk(BoardVO vo) {
		
		int result = service.boardUpdate(vo);
		ModelAndView mav = new ModelAndView();
		if (result > 0) {	// ���� ����
			mav.setViewName("redirect:view?no="+vo.getNo());
		} else {		// ���� ����
			mav.addObject("msg", "����");
			mav.setViewName("board/boardResult");
		}
		return mav;
	}
	
	// �Խñ� ����
	@GetMapping("/delete")
	public ModelAndView boardDelete(int no) {
		ModelAndView mav = new ModelAndView();
		int result = service.boardDelete(no);
		
		if (result > 0) {	// ���� ����
			mav.setViewName("redirect:boardList");
		} else {		// ���� ����
			mav.setViewName("redirect:view?no="+no);
		}
		return mav;
	}
}
