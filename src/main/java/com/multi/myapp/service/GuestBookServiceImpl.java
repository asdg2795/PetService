package com.multi.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.dao.GuestBookDao;
import com.multi.myapp.vo.GuestBookVO;

@Service
public class GuestBookServiceImpl implements GuestBookService{
	@Autowired
	GuestBookDao dao;

	@Override
	public List<GuestBookVO> GBookSelect(int no) {
		return dao.GBookSelect(no);
	}

	@Override
	public int GbookInsert(GuestBookVO vo) {
		return dao.GbookInsert(vo);
	}

	@Override
	public int GbookDelete(int replyno) {
		return dao.GbookDelete(replyno);
	}
}
