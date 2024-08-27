package com.multi.myapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.ManagerPageVO;

@Mapper
public interface ManagerPageDao {
	public List<ManagerPageVO> userManage();
	public List<ManagerPageVO> petManage();
	public List<ManagerPageVO> reportManage();
	public int ManagerDelete(int no);
	public List<ManagerPageVO> requestManage();
	public List<ManagerPageVO> reviewManage();
	public List<ManagerPageVO> boardManage();
	public List<ManagerPageVO> walkingManage();
	public int courseDel(Map<String, Object> params);
	public int UserDel(Map<String, Object> params);
	public int PetProfileDel(Map<String, Object> params);
	public int PostDel(Map<String, Object> params);
	public int PartyDel(Map<String, Object> params);
	public int ReviewDel(Map<String, Object> params);
}
