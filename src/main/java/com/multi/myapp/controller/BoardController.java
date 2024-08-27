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
	
	// 게시판
	@GetMapping("/boardList")
	public ModelAndView boardList(PagingVO pVO) {
		System.out.println(123);
		ModelAndView mav = new ModelAndView();
		// 총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		// DB선택(page, 검색)
		List<BoardVO> list = service.boardPageList(pVO);
		mav.addObject("pVO", pVO);
		mav.addObject("list", list);
		mav.setViewName("board/boardList");
		return mav;
	}
	
	// 글쓰기폼
	@GetMapping("/write")
	public String boardWrite(HttpSession session) {
		 if (session.getAttribute("logStatus") != "Y") {
	            return "sign/login";
	        }
		return "board/boardWrite";
	}
	
	// 글 등록(DB)
	@PostMapping("/writeOk")
	public ModelAndView boardWriteOk(BoardVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// subject, content -> vo에 request
		// request -> session
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		
		/////////////////////////
		int result = service.boardInsert(vo);
		if(result > 0) {		// 글 등록
			mav.setViewName("redirect:boardList");
		} else {		// 등록 실패
			mav.addObject("msg", "등록");
			mav.setViewName("board/boardResult");	
		}
		return mav;
	}
	
	// 글 내용보기
	@GetMapping("/view")
	public ModelAndView boardView(int no, PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
				
		service.hitCount(no);	// 조회수 증가
		BoardVO vo = service.boardSelect(no);	// 레코드 선택
		
		mav.addObject("vo", vo);
		mav.addObject("pVO", pVO);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	
	// 글 수정 폼
	@GetMapping("/edit")
	public ModelAndView boardEdit(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.boardSelect(no));
		mav.setViewName("board/boardEdit");
		
		return mav;
	}
	
	// 글 수정(DB)
	@PostMapping("/editOk")
	public ModelAndView boardEditOk(BoardVO vo) {
		
		int result = service.boardUpdate(vo);
		ModelAndView mav = new ModelAndView();
		if (result > 0) {	// 수정 성공
			mav.setViewName("redirect:view?no="+vo.getNo());
		} else {		// 수정 실패
			mav.addObject("msg", "수정");
			mav.setViewName("board/boardResult");
		}
		return mav;
	}
	
	// 게시글 삭제
	@GetMapping("/delete")
	public ModelAndView boardDelete(int no) {
		ModelAndView mav = new ModelAndView();
		int result = service.boardDelete(no);
		
		if (result > 0) {	// 삭제 성공
			mav.setViewName("redirect:boardList");
		} else {		// 삭제 실패
			mav.setViewName("redirect:view?no="+no);
		}
		return mav;
	}
}
