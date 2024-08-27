package com.multi.myapp.service;

import java.io.PrintWriter; 


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.dao.SignDao;
import com.multi.myapp.vo.SignVO;

@Service
public class SignServiceImpl implements SignService{
	@Autowired
	SignDao dao;

	@Override
	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}

	@Override
	public int usersInsert(SignVO vo) {
		return dao.usersInsert(vo);
	}

	@Override
	public SignVO loginSelect(String userid, String userpwd) {
		return dao.loginSelect(userid, userpwd);
	}

	@Override
	public SignVO findId(SignVO vo) {
		return dao.findId(vo);
	}

	@Override
	public SignVO findPwd(SignVO vo) {
		return dao.findPwd(vo);
	}

	@Override
	public int pwdUpdate(SignVO vo) {
		return dao.pwdUpdate(vo);
	}

	@Override
	public SignVO findIdSelect(SignVO vo) {
		return dao.findIdSelect(vo);
	}



}
