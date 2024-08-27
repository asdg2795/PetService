package com.multi.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.BoardReplyVO;

@Mapper
public interface BoardReplyMapper {
	
	public int replyInsert(BoardReplyVO vo);	// ��� �Է�
	public List<BoardReplyVO> replySelect(int no);	//	��� ���
	public int replyUpdate(BoardReplyVO vo);	// ��� ����(DB)
	public int replyDelete(int replyno);	// ��� ����

}
