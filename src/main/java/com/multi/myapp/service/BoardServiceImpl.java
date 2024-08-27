package com.multi.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.myapp.mapper.BoardMapper;
import com.multi.myapp.vo.BoardVO;
import com.multi.myapp.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;

	@Override
	public int boardInsert(BoardVO vo) {
		return mapper.boardInsert(vo);
	}

	@Override
	public List<BoardVO> boardPageList(PagingVO pVO) {
		return mapper.boardPageList(pVO);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return mapper.totalRecord(pVO);
	}

	@Override
	public BoardVO boardSelect(int no) {
		return mapper.boardSelect(no);
	}

	@Override
	public void hitCount(int no) {
		mapper.hitCount(no);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return mapper.boardUpdate(vo);
	}

	@Override
	public int boardDelete(int no) {
		return mapper.boardDelete(no);
	}

}
