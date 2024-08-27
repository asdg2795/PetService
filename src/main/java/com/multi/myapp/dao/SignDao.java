package com.multi.myapp.dao;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.SignVO;

@Mapper
public interface SignDao {
	public int idCheck(String userid);
	public int usersInsert(SignVO vo);
	public SignVO loginSelect(String userid, String userpwd);
	public SignVO findId(SignVO vo);
	public SignVO findPwd(SignVO vo);
	public int pwdUpdate(SignVO vo);
	public SignVO findIdSelect(SignVO vo);
}
