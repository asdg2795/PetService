package com.multi.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.WalkingVO;

@Mapper
public interface WalkingDao {
	public List<WalkingVO> walkingSelect();
	public int WalkingInsert(WalkingVO wVO);
	public int RequestInsert(WalkingVO wVO);

	
}
