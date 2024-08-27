package com.multi.myapp.service; 

import java.util.List;

import com.multi.myapp.vo.BoardReplyVO;

public interface BoardReplyService {

	public int replyInsert(BoardReplyVO vo); // ´ñ±Û

	public List<BoardReplyVO> replySelect(int no); // ´ñ±Û ¸ñ·Ï

	public int replyUpdate(BoardReplyVO vo); // ´ñ±Û ¼öÁ¤(DB)

	public int replyDelete(int replyno); // ´ñ±Û »èÁ¦

}
