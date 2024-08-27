package com.multi.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

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

@Mapper
@Repository
public interface UserMapper {
	public UserVO getUserInfo(String logId); //媛쒖씤 젙蹂  媛  졇 삤湲 
	public int updateuser(UserVO vo); // 媛쒖씤 젙蹂   닔 젙
	public int countusername(String username); // 땳 꽕 엫 以묐났寃  궗
	public PetVO getmypet(String logId); //  렖 젙蹂  媛  졇 삤湲 
	public int petupdate(PetVO vo); // 렖 젙蹂   뾽 뜲 씠 듃
	public List<WriteVO> writeList(WritePagingVO WPVO); // 궡湲 紐⑸줉 媛  졇 삤湲 
	public List<GroupVO> groupList(GroupPagingVO GPVO); // 궡紐⑥엫 媛  졇 삤湲 
	public List<FriendVO> friendList(FriendPagingVO FPVO); //移쒓뎄紐⑸줉 媛  졇 삤湲 
	public List<ApplyVO> applyList(ApplyPagingVO APVO); // 떊泥 紐⑸줉 媛  졇 삤湲 
	public List<GmemberVO> gmemberList(GmemberPagingVO GMPVO); //紐⑥엫 쉶 썝 젙蹂  媛  졇 삤湲 
	public int totalRecord(PagingVO PVO); //肄붿뒪 럹 씠吏뺤쿂由 
	public int writetotalRecord(WritePagingVO PVO); // 궡湲  럹 씠吏뺤쿂由 
	public int bookmarktotalRecord(BookmarkPagingVO BPVO); //利먯갼 럹 씠吏뺤쿂由 
	public int grouptotalRecord(GroupPagingVO GPVO); //紐⑥엫 럹 씠吏뺤쿂由 
	public int friendtotalRecord(FriendPagingVO FPVO); //移쒓뎄 럹 씠吏뺤쿂由 
	public int applytotalRecord(ApplyPagingVO APVO); // 떊泥 紐⑸줉  럹 씠吏뺤쿂由 
	public int gmembertotalRecord(GmemberPagingVO GMPVO); //肄붿뒪 럹 씠吏뺤쿂由 
 	public List<CourseVO> courseList(PagingVO PVO); //肄붿뒪紐⑸줉 媛  졇 삤湲 
 	public int courseDel(Map<String, Object> params); //肄붿뒪 궘 젣
	public List<BookmarkVO> bookmarkList(BookmarkPagingVO BPVO); //利먯갼 媛  졇 삤湲 
	public int markDel(Map<String, Object> params); //利먯갼 궘 젣
	public int friendDel(Map<String, Object> params); //移쒓뎄 궘 젣
	public int applyDel(Map<String, Object> params); // 떊泥 紐⑸줉 궘 젣
	public int writeDel(Map<String, Object> params); //湲  궘 젣
	public int groupDel(Map<String, Object> params); //紐⑥엫 궘 젣
	public int memberDel(Map<String, Object> params); //紐⑥엫-> 쉶 썝 궘 젣
	public int groupDrop(Map<String, Object> params); //紐⑥엫 궘 젣
	public int addfriend(Map<String, Object> params); //移쒓뎄 닔 씫
	public int updateinfo(Map<String, Object> params); //紐⑥엫 젙蹂   닔 젙 
	public int addgroup(Map<String, Object> params); //紐⑥엫 닔 씫
	public String getpassword(String logId); // 쉶 썝 깉 눜  쟾 鍮꾨 踰덊샇  솗 씤
	public String withdraw(String logId); // 쉶 썝 깉 눜
	public FriendInfoVO getFriendInfoByName(String friendID); //移쒓뎄 젙蹂  媛  졇 삤湲 
	public int petinput(PetVO vo);
}
