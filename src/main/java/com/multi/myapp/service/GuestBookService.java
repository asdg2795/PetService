package com.multi.myapp.service;

import java.util.List; 

import com.multi.myapp.vo.GuestBookVO;

public interface GuestBookService {

	public List<GuestBookVO> GBookSelect(int no);
	public int GbookInsert(GuestBookVO vo);
	public int GbookDelete(int replyno);
	

}
