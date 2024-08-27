package com.multi.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.GuestBookVO;

@Mapper
public interface GuestBookDao {
	public List<GuestBookVO> GBookSelect(int no);
	public int GbookInsert(GuestBookVO vo);
	public int GbookDelete(int replyno);
}
