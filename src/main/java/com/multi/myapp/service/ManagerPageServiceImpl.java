package com.multi.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.dao.ManagerPageDao;
import com.multi.myapp.vo.ManagerPageVO;

@Service
public class ManagerPageServiceImpl implements ManagerPageService{
	@Autowired
	ManagerPageDao dao;
	
	@Override
	public List<ManagerPageVO> userManage() {
		return dao.userManage();
	}

	@Override
	public List<ManagerPageVO> petManage() {
		return dao.petManage();
	}

	@Override
	public List<ManagerPageVO> reportManage() {
		return dao.reportManage();
	}

	@Override
	public int ManagerDelete(int no) {
		return dao.ManagerDelete(no);
	}

	@Override
	public List<ManagerPageVO> requestManage() {
		return dao.requestManage();
	}

	@Override
	public List<ManagerPageVO> reviewManage() {
		return dao.reviewManage();
	}

	@Override
	public List<ManagerPageVO> boardManage() {
		return dao.boardManage();
	}

	@Override
	public List<ManagerPageVO> walkingManage() {
		return dao.walkingManage();
	}

	@Override
	public int courseDel(Map<String, Object> params) {
		return dao.courseDel(params);
	}

	@Override
	public int UserDel(Map<String, Object> params) {
		return dao.UserDel(params);
	}

	@Override
	public int PetProfileDel(Map<String, Object> params) {
		return dao.PetProfileDel(params);
	}

	@Override
	public int PostDel(Map<String, Object> params) {
		return dao.PostDel(params);
	}

	@Override
	public int PartyDel(Map<String, Object> params) {
		return dao.PartyDel(params);
	}

	@Override
	public int ReviewDel(Map<String, Object> params) {
		return dao.ReviewDel(params);
	}

}
