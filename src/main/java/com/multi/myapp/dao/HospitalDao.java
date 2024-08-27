package com.multi.myapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.FindFriendVO;
import com.multi.myapp.vo.HospitalVO;
import com.multi.myapp.vo.PagingVO;

@Mapper
public interface HospitalDao {
	public int reviewInsert(HospitalVO hvo);
	public List<HospitalVO> hospitalSelect();
	public int totalRecord(PagingVO pVO);
	public List<HospitalVO> reviewSelect();
	public int Del(Map<String, Object> params);
	
}
