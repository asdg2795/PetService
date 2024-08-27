package com.multi.myapp.service;

	import java.util.List;

	import com.multi.myapp.vo.BoardVO;
	import com.multi.myapp.vo.PagingVO;

	public interface BoardService {
		public int boardInsert(BoardVO vo);
		public List<BoardVO> boardPageList(PagingVO pVO); // page에 해당하는 레코드 선택
		public int totalRecord(PagingVO pVO);	// 총 레코드 수
		public BoardVO boardSelect(int no);	//	해당 레코드 선택
		public void hitCount(int no);	// 조회수 증가
		public int boardUpdate(BoardVO vo);	// 게시판 수정
		public int boardDelete(int no);		// 게시글 삭제

}
