package com.multi.myapp.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.dao.FindFriendDao;
import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.PagingVO;

@Service
public class FindFriendServiceImpl implements FindFriendService{
	@Autowired
	FindFriendDao dao;

	@Override
	public int boardInsert(FindFriendVO ffvo) {
		return dao.boardInsert(ffvo);
	}

	@Override
	public List<FindFriendVO> findFriend() {
		return dao.findFriend();
	}

	@Override
	public List<FindFriendVO> guestbook() {
		return dao.guestbook();
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public FindFriendVO petprofile(int no) {
		return dao.petprofile(no);
	}

	@Override
	public int reportInsert(FindFriendVO ffvo) {
		return dao.reportInsert(ffvo);
	}

	@Override
	public int petRegisterInsert(FindFriendVO ffvo) {
		return dao.petRegisterInsert(ffvo);
	}

	@Override
	public FindFriendVO petlist(String userid) {
		return dao.petlist(userid);
	}

	@Override
	public FindFriendVO petid(FindFriendVO vo) {
		return dao.petid(vo);
	}

	@Override
	public int findfriendRequest(FindFriendVO ffvo) {
		return dao.findfriendRequest(ffvo);
	}
	


}
