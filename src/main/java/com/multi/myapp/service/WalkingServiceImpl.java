package com.multi.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.dao.WalkingDao;
import com.multi.myapp.vo.WalkingVO;

@Service
public class WalkingServiceImpl implements WalkingService{
	@Autowired
	WalkingDao dao;

	@Override
	public List<WalkingVO> walkingSelect() {
		return dao.walkingSelect();
	}

	@Override
	public int WalkingInsert(WalkingVO wVO) {
		return dao.WalkingInsert(wVO);
	}

	@Override
	public int RequestInsert(WalkingVO wVO) {
		return dao.RequestInsert(wVO);
	}



}
