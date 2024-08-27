package com.multi.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.dao.HospitalDao;
import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.HospitalVO;
import com.multi.myapp.vo.PagingVO;

@Service
public class HospitalServiceImpl implements HospitalService{
	@Autowired
	HospitalDao dao;

	@Override
	public int reviewInsert(HospitalVO hvo) {
		return dao.reviewInsert(hvo);
	}

	@Override
	public List<HospitalVO> hospitalSelect() {
		return dao.hospitalSelect();
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public List<HospitalVO> reviewSelect() {
		return dao.reviewSelect();
	}

	@Override
	public int Del(Map<String, Object> params) {
		return dao.Del(params);
	}





	

}
