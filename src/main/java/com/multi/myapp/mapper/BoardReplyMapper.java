package com.multi.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.myapp.vo.BoardReplyVO;

@Mapper
public interface BoardReplyMapper {
	
	public int replyInsert(BoardReplyVO vo);	// ´ñ±Û ÀÔ·Â
	public List<BoardReplyVO> replySelect(int no);	//	´ñ±Û ¸ñ·Ï
	public int replyUpdate(BoardReplyVO vo);	// ´ñ±Û ¼öÁ¤(DB)
	public int replyDelete(int replyno);	// ´ñ±Û »èÁ¦

}
