package com.multi.myapp.service;

import java.util.List;  

import org.springframework.stereotype.Service;

import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.PagingVO;

public interface FindFriendService {
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
