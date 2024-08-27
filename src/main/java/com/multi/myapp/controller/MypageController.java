package com.multi.myapp.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.multi.myapp.service.UserService;
import com.multi.myapp.vo.ApplyPagingVO;
import com.multi.myapp.vo.ApplyVO;
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
import com.multi.myapp.vo.BookmarkPagingVO;

@Controller
public class MypageController {
   
   @Inject
   UserService service;
   
   @GetMapping("/mypage/mypageMain")
   public ModelAndView getUserInfo(HttpSession session) { //HttpSession session
      ModelAndView mav = new ModelAndView();      
      String logId = (String)session.getAttribute("logId");

      UserVO vo = service.getUserInfo(logId);
      
      mav.addObject("uVO", vo);
      mav.setViewName("/mypage/mypageMain");
      
      return mav;
   }
   @PostMapping("/checknick")
   @ResponseBody
   public String checkNickname(@RequestParam("username") String username) {
      boolean Check = service.checkusername(username);
      return Check ?   "사용 가능합니다." : "이미 사용중입니다.";
   }
   @PostMapping("/mypagesubmit")
   public ModelAndView mypagesubmit(UserVO vo, HttpSession session) { //HttpSession session
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");
      vo.setUserid(logId);      

      int result = service.updateuser(vo);
      mav.addObject("result", result);
      mav.setViewName("/mypage/mypageMain");
      
      return mav;
   }
   @PostMapping("/infomod")
   public String infomod(@RequestParam("groupinfo") String groupinfo,
                     @RequestParam("groupname") String groupname) {
      Map<String, Object> params = new HashMap<>();
      params.put("groupinfo", groupinfo);
      params.put("groupname", groupname);
      
      int updateResult =  service.updateinfo(params);
      
      if(updateResult >0) {
         return "/mypage/grouptable";
      }else {
         return "false";
      }
   }
   @GetMapping("/mypage/mycourse")
   public ModelAndView getmycourse(PagingVO PVO, HttpSession session) { //HttpSession session
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");
      PVO.setSearchKey(logId);
      PVO.setTotalRecord(service.totalRecord(PVO));
      List<CourseVO> list = service.courseList(PVO);
      System.out.println(list.toString());
      System.out.println(PVO.toString());
      mav.addObject("list",list);
      mav.addObject("PVO", PVO);
      mav.setViewName("/mypage/mycourse");
      
      return mav;
   }
   @GetMapping("/mypage/courseDel")
   @ResponseBody
   public int courseDel(@RequestParam("courseno") int courseno, HttpSession session) {
      String logId = (String)session.getAttribute("logId");
      Map<String, Object> params = new HashMap<>();
       params.put("courseno", courseno);
       params.put("logId", logId);
      
      return service.courseDel(params);
   }
   @GetMapping("/mypage/applyDel")
   @ResponseBody
   public int applyDel(@RequestParam("applyid") String applyid, HttpSession session) {
      String logId = (String)session.getAttribute("logId");

      Map<String,Object> params = new HashMap<>();
      params.put("applyid", applyid);
      params.put("logId", logId);
      
      return service.applyDel(params);
   }
   
   @GetMapping("/mypage/friendDel")
   @ResponseBody
   public int friendDel(@RequestParam("friendname") String friendname, HttpSession session) {
      String logId = (String)session.getAttribute("logId");

      Map<String, Object> params = new HashMap<>();
      params.put("friendname", friendname);
      params.put("logId", logId);
      
      return service.friendDel(params);
   }
   @GetMapping("/mypage/writeDel")
   @ResponseBody
   public int writeDel(@RequestParam("subject") String subject, HttpSession session) {
      String logId = (String)session.getAttribute("logId");
      
      Map<String, Object> params = new HashMap<>();
      params.put("subject", subject);
      params.put("logId", logId);
      
      return service.writeDel(params);
   }
   @GetMapping("/mypage/groupDel")
   @ResponseBody
   public int groupDel(@RequestParam("groupname") String groupname, HttpSession session) {
      String logId = (String)session.getAttribute("logId");

      Map<String, Object> params = new HashMap<>();
      params.put("groupname", groupname);
      params.put("logId", logId);
      
      return service.groupDel(params);
   }
   @GetMapping("/mypage/mypet")
   public ModelAndView getmypet(HttpSession session) { //HttpSession session 
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");
      
      PetVO vo = service.getmypet(logId);
      
      mav.addObject("pVO", vo);
      mav.setViewName("/mypage/mypet");
      
      return mav;
   }
   @PostMapping("/mypage/petsubmit")
   @ResponseBody
   public ModelAndView mypetsubmit(@RequestParam("petname") String petname,
                           @RequestParam("petwant") String petwant,
                           @RequestParam("petage") String petage,
                           @RequestParam("pethobby") String pethobby,
                           @RequestParam("petkind") String petkind,
                           @RequestParam("addr") String addr,
                           @RequestParam("petgender") String petgender,
                           @RequestParam("petsize") String size,
                           @RequestParam("introducing") String introducing,
                           @RequestParam("petimg") MultipartFile file, 
                           HttpSession session ) {
      
      PetVO vo =new PetVO();
      String path = session.getServletContext().getRealPath("/img");
      String filename =FileUpload.fileUpload(path, file);
      
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");
      vo.setUserid(logId);
      vo.setPetimg(filename);
      vo.setPetage(petage);
      vo.setPetgender(petgender);
      vo.setPethobby(pethobby);
      vo.setPetsize(size);
      vo.setPetkind(petkind);
      vo.setAddr(addr);
      vo.setIntroducing(introducing);
      vo.setPetwant(petwant);
      vo.setPetname(petname);
      System.out.println(vo.toString());
      int result = service.petupdate(vo);
      
      mav.addObject("result", result);
      mav.setViewName("redirect:mypet");
      return mav;
   }
   @PostMapping("/mypage/petinput")
   @ResponseBody
   public ModelAndView mypetinput(@RequestParam("petname") String petname,
         @RequestParam("petwant") String petwant,
         @RequestParam("petage") String petage,
         @RequestParam("pethobby") String pethobby,
         @RequestParam("petgender") String petgender,
         @RequestParam("petsize") String size,
         @RequestParam("petkind") String petkind,
         @RequestParam("addr") String addr,
         @RequestParam("introducing") String introducing,
         @RequestParam("petimg") MultipartFile file, 
         HttpSession session ) {

      PetVO vo =new PetVO();
      String path = session.getServletContext().getRealPath("/img");
      String filename =FileUpload.fileUpload(path, file);
      
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");
      vo.setUserid(logId);
      vo.setPetimg(filename);
      vo.setPetage(petage);
      vo.setPetgender(petgender);
      vo.setPethobby(pethobby);
      vo.setPetsize(size);
      vo.setPetkind(petkind);
      vo.setAddr(addr);
      vo.setIntroducing(introducing);
      vo.setPetwant(petwant);
      vo.setPetname(petname);
      System.out.println(vo.toString());
      int result = service.petinput(vo);
      
      mav.addObject("result", result);
      mav.setViewName("redirect:mypet");
      return mav;
   }
   @GetMapping("/mypage/myfavorite")
   public ModelAndView getmymark(BookmarkPagingVO BPVO, HttpSession session) { 
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");

      BPVO.setSearchKey(logId);
      BPVO.setTotalRecord(service.bookmarktotalRecord(BPVO));
      List<BookmarkVO> list = service.bookmarkList(BPVO);
      System.out.println(list.toString());
      mav.addObject("list",list);
      mav.addObject("BPVO",BPVO);
      mav.setViewName("/mypage/myfavorite");
      
      return mav;
   }
   @GetMapping("/mypage/markDel")
   @ResponseBody
   public int markDel(@RequestParam("markname") String markname, HttpSession session) {
      String logId = (String)session.getAttribute("logId");
      
      Map<String, Object> params = new HashMap<>();
       params.put("markname", markname);
       params.put("logId", logId);
      
      return service.markDel(params);
   }
   @GetMapping("/mypage/memberDel")
   @ResponseBody
   public int memberDel(@RequestParam("membername") String membername,
                   @RequestParam("groupname") String groupname){
      
      Map<String, Object> params = new HashMap<>();
      params.put("membername", membername);
      params.put("groupname", groupname);
      
      return service.memberDel(params);
   }
   @GetMapping("/mypage/groupDrop")
   @ResponseBody
   public int groupDrop(@RequestParam("groupname") String groupname) {
      Map<String, Object> params = new HashMap<>();
      params.put("groupname", groupname);
      
      return service.groupDrop(params);
   }
   @GetMapping("/mypage/mywrite")
   public ModelAndView getmywrite(WritePagingVO WPVO, HttpSession session) { //HttpSession session
      ModelAndView mav = new ModelAndView(); 
      String logId = (String)session.getAttribute("logId");
      WPVO.setSearchKey(logId);
      WPVO.setTotalRecord(service.writetotalRecord(WPVO));
      List<WriteVO> list = service.writeList(WPVO);
      
      mav.addObject("list", list);
      mav.addObject("WPVO", WPVO);
      mav.setViewName("/mypage/mywrite");
      
      return mav;
   }
   @GetMapping("/mypage/mywrite_page")
   public String mywrite_page() {
      return "/mypage/mywrite_page";
   }   
   @GetMapping("/mypage/mygroup")
   public ModelAndView mygroup(GroupPagingVO GPVO, HttpSession session) { //HttpSession session
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");

      GPVO.setSearchKey(logId);
      GPVO.setTotalRecord(service.grouptotalRecord(GPVO));
      List<GroupVO> list = service.groupList(GPVO);
      
      mav.addObject("list",list);
      mav.addObject("GPVO", GPVO);
      mav.setViewName("/mypage/mygroup");
      
      return mav;
   }   
   @GetMapping("/mypage/myfriend")
   public ModelAndView myfriend(FriendPagingVO FPVO, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String logId = (String)session.getAttribute("logId");
      FPVO.setSearchKey(logId);
      FPVO.setTotalRecord(service.friendtotalRecord(FPVO));
      List<FriendVO> list = service.friendList(FPVO);
   
      mav.addObject("list", list);
      mav.addObject("FPVO",FPVO);
      mav.setViewName("/mypage/myfriend");
      
      return mav;
   }
   @GetMapping("/mypage/getFriendInfo")
   @ResponseBody
   public FriendInfoVO getFriendInfo(@RequestParam("friendID") String friendID) {
      FriendInfoVO vo = service.getFriendInfoByName(friendID);   
       return vo;
   }
   @GetMapping("/mypage/applyList")
   public ModelAndView applyList(ApplyPagingVO APVO, HttpSession session) { //HttpSession session
      ModelAndView mav = new ModelAndView(); 
      String logId = (String)session.getAttribute("logId");

      APVO.setSearchKey(logId);
      APVO.setTotalRecord(service.applytotalRecord(APVO));
      List<ApplyVO> list = service.applyList(APVO);
      
      mav.addObject("list",list);
      mav.addObject("APVO", APVO);
      mav.setViewName("/mypage/applyList");
      
      return mav;
   }
   @GetMapping("/mypage/addfriend")
   @ResponseBody
   public int addfriend(@RequestParam("applyid") String applyid,
		   				@RequestParam("applyname") String applyname,
                   HttpSession session) {
      String logId = (String)session.getAttribute("logId");
      
      Map<String, Object> params = new HashMap<>();
      
      params.put("applyid", applyid);
      params.put("applyname", applyname);
      params.put("logId", logId);
      
      return service.addfriend(params);
   }
   @GetMapping("/mypage/addgroup")
   @ResponseBody
   public int addgroup(@RequestParam("applyid") String applyid,
			   		   @RequestParam("applyname") String applyname,
	                   @RequestParam("groupname") String groupname) {
      
      Map<String, Object> params = new HashMap<>();
      
      params.put("applyid", applyid);
      params.put("applyname", applyname);
      params.put("groupname", groupname);
      
      return service.addgroup(params);
   }
   @PostMapping("/mypage/checkpass")
   @ResponseBody
   public Map<String, String> checkpass(HttpSession session,
                          @RequestParam("password") String password) {
      Map<String, String> result = new HashMap<>();
      String logId = (String)session.getAttribute("logId");

      String logpassword = service.getpassword(logId);
      System.out.println("비밀번호 : "+logpassword);
      
      if(password.equals(logpassword)) {
         result.put("result", "success");
      }else {
         result.put("result", "fail");
      }
      return result;
   }
   @PostMapping("/mypage/withdraw")
   @ResponseBody
   public Map<String, String> withdraw(HttpSession session) {
      Map<String, String> result = new HashMap<>();
      String logId = (String)session.getAttribute("logId");
      
       try {
          service.withdraw(logId);
          result.put("result", "success");
         session.invalidate();
      } catch (Exception e) {
          result.put("result", "fail");
          result.put("message", "회원 탈퇴 중 오류가 발생했습니다.");
          e.printStackTrace();
      }
      return result;   
   }
   @GetMapping("/mypage/outmember")
   public String outmember() {
      return "/mypage/outmember";
   }
   @PostMapping("/logout")
    public String logout(HttpSession session) { //추가해야 될사항(탈퇴 후 로그아웃상태로 메인)
        session.invalidate();

        return "redirect:/";  
    }
   @GetMapping("/mypage/grouptable")
   public ModelAndView grouptable(@RequestParam("groupname") String groupname,
                           GmemberPagingVO GMPVO) {
      ModelAndView mav = new ModelAndView();
      GMPVO.setSearchKey(groupname);
      GMPVO.setTotalRecord(service.gmembertotalRecord(GMPVO));
      List<GmemberVO> list = service.gmemberList(GMPVO);
      
      mav.addObject("list",list);
      mav.addObject("GMPVO", GMPVO);
      mav.setViewName("/mypage/grouptable");
      
      return mav;
   }
}