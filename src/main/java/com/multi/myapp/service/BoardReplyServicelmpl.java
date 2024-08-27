package com.multi.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.mapper.BoardReplyMapper;
import com.multi.myapp.vo.BoardReplyVO;

@Service
public class BoardReplyServicelmpl implements BoardReplyService {

	@Autowired
	BoardReplyMapper mapper;

	@Override
	public int replyInsert(BoardReplyVO vo) {
		return mapper.replyInsert(vo);
	}

	@Override
	public List<BoardReplyVO> replySelect(int no) {
		return mapper.replySelect(no);
	}

	@Override
	public int replyUpdate(BoardReplyVO vo) {
		return mapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int replyno) {
		return mapper.replyDelete(replyno);
	}
}
