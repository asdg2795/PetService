package com.multi.myapp.service; 

import java.util.List;

import com.multi.myapp.vo.BoardReplyVO;

public interface BoardReplyService {

	public int replyInsert(BoardReplyVO vo); // ���

	public List<BoardReplyVO> replySelect(int no); // ��� ���

	public int replyUpdate(BoardReplyVO vo); // ��� ����(DB)

	public int replyDelete(int replyno); // ��� ����

}
