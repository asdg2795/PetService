package com.multi.myapp.service;

import javax.servlet.http.HttpServletResponse; 

import com.multi.myapp.vo.SignVO;

public interface SignService {

	public int idCheck(String userid);
	public int usersInsert(SignVO vo);
	public SignVO loginSelect(String userid, String userpwd);
	public SignVO findId(SignVO vo);
	public SignVO findPwd(SignVO vo);
	public int pwdUpdate(SignVO vo);
	public SignVO findIdSelect(SignVO vo);
}
