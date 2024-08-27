package com.multi.myapp.dao;

import java.util.List;  

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.PagingVO;

@Mapper
public interface FindFriendDao {
	public int boardInsert(FindFriendVO ffvo);
	public List<FindFriendVO> findFriend();
	public List<FindFriendVO> guestbook();
	public int totalRecord(PagingVO pVO);
	public FindFriendVO petprofile(int no);
	public int reportInsert(FindFriendVO ffvo);
	public int petRegisterInsert(FindFriendVO ffvo);
	public FindFriendVO petlist(String userid);
	public FindFriendVO petid(FindFriendVO vo);
	public int findfriendRequest(FindFriendVO ffvo);
}
