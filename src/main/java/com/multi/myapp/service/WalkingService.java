package com.multi.myapp.service;

import java.util.List; 

import com.multi.myapp.vo.WalkingVO;

public interface WalkingService {

	public List<WalkingVO> walkingSelect();
	public int WalkingInsert(WalkingVO wVO);
	public int RequestInsert(WalkingVO wVO);
	

}
