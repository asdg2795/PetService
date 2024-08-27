package com.multi.myapp.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multi.myapp.mapper.UserMapper;
import com.multi.myapp.vo.ApplyPagingVO;
import com.multi.myapp.vo.ApplyVO;
import com.multi.myapp.vo.BookmarkPagingVO;
import com.multi.myapp.vo.BookmarkVO;
import com.multi.myapp.vo.CourseVO;
import com.multi.myapp.vo.FriendInfoVO;
import com.multi.myapp.vo.FriendPagingVO;
import com.multi.myapp.vo.FriendVO;
import com.multi.myapp.vo.GmemberPagingVO;
import com.multi.myapp.vo.GmemberVO;
import com.multi.myapp.vo.GroupPagingVO;
import com.multi.myapp.vo.GroupVO;
import com.multi.myapp.vo.PagingVO;
import com.multi.myapp.vo.PetVO;
import com.multi.myapp.vo.UserVO;
import com.multi.myapp.vo.WritePagingVO;
import com.multi.myapp.vo.WriteVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	UserMapper mapper;

	@Override
	public UserVO getUserInfo(String logId) {		
		return mapper.getUserInfo(logId);
	}
	@Override
	public int updateuser(UserVO vo) {		
		return mapper.updateuser(vo);
	}
	@Override
	public PetVO getmypet(String logId) {		
		return mapper.getmypet(logId);
	}
	@Override
	public int totalRecord(PagingVO PVO) {	
		return mapper.totalRecord(PVO);
	}
	@Override
	public List<CourseVO> courseList(PagingVO PVO) {
		return mapper.courseList(PVO);
	}
	@Override
	public List<BookmarkVO> bookmarkList(BookmarkPagingVO BPVO) {
		return mapper.bookmarkList(BPVO);
	}
	@Override
	public boolean checkusername(String username) {
		return mapper.countusername(username) == 0;
	}
	@Override
	public int courseDel(Map<String, Object> params) {
		return mapper.courseDel(params);
	}
	@Override
	public int petupdate(PetVO vo) {
		return mapper.petupdate(vo);
	}
	@Override
	public int markDel(Map<String, Object> params) {
		return mapper.markDel(params);
	}
	@Override
	public List<WriteVO> writeList(WritePagingVO WPVO) {
		return mapper.writeList(WPVO);
	}
	@Override
	public List<GroupVO> groupList(GroupPagingVO GPVO) {
		return mapper.groupList(GPVO);
	}
	@Override
	public int writetotalRecord(WritePagingVO PVO) {
		return mapper.writetotalRecord(PVO);
	}
	@Override
	public int bookmarktotalRecord(BookmarkPagingVO BPVO) {
		return mapper.bookmarktotalRecord(BPVO);
	}
	@Override
	public int grouptotalRecord(GroupPagingVO GPVO) {
		return mapper.grouptotalRecord(GPVO);
	}
	@Override
	public List<FriendVO> friendList(FriendPagingVO FPVO) {
		return mapper.friendList(FPVO);
	}
	@Override
	public int friendtotalRecord(FriendPagingVO FPVO) {
		return mapper.friendtotalRecord(FPVO);
	}
	@Override
	public List<ApplyVO> applyList(ApplyPagingVO APVO) {
		return mapper.applyList(APVO);
	}
	@Override
	public int applytotalRecord(ApplyPagingVO APVO) {
		return mapper.applytotalRecord(APVO);
	}
	@Override
	public int friendDel(Map<String, Object> params) {
		return mapper.friendDel(params);
	}
	@Override
	public int applyDel(Map<String, Object> params) {
		return mapper.applyDel(params);
	}
	@Override
	public int writeDel(Map<String, Object> params) {
		return mapper.writeDel(params);
	}
	@Override
	public int groupDel(Map<String, Object> params) {
		return mapper.groupDel(params);
	}
	@Override
	public int gmembertotalRecord(GmemberPagingVO GMPVO) {
		return mapper.gmembertotalRecord(GMPVO);
	}
	@Override
	public List<GmemberVO> gmemberList(GmemberPagingVO GMPVO) {
		return mapper.gmemberList(GMPVO);
	}
	@Override
	public int memberDel(Map<String, Object> params) {
		return mapper.memberDel(params);
	}
	@Override
	public int addfriend(Map<String, Object> params) {
		return mapper.addfriend(params);
	}
	@Override
	public int addgroup(Map<String, Object> params) {
		return mapper.addgroup(params);
	}
	@Override
	public String getpassword(String logId) {
		return mapper.getpassword(logId);
	}
	@Override
	public int groupDrop(Map<String, Object> params) {
		return mapper.groupDrop(params);
	}
	@Override
	public String withdraw(String logId) {
		return mapper.withdraw(logId);
	}
	@Override
	public FriendInfoVO getFriendInfoByName(String friendID) {
		return mapper.getFriendInfoByName(friendID);
	}
	@Override
	public int updateinfo(Map<String, Object> params) {
		return mapper.updateinfo(params);
	}
	@Override
	public int petinput(PetVO vo) {
		return mapper.petinput(vo);
	}


	
}
