package com.multi.myapp.service;

import java.util.List;
import java.util.Map;

import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.HospitalVO;
import com.multi.myapp.vo.PagingVO;

public interface HospitalService {

	public int reviewInsert(HospitalVO hvo);
	public List<HospitalVO> hospitalSelect();
	public int totalRecord(PagingVO pVO);
	public List<HospitalVO> reviewSelect();
	public int Del(Map<String, Object> params);
	
	
}
