package com.multi.myapp.service;

	import java.util.List;

	import com.multi.myapp.vo.BoardVO;
	import com.multi.myapp.vo.PagingVO;

	public interface BoardService {
		public int boardInsert(BoardVO vo);
		public List<BoardVO> boardPageList(PagingVO pVO); // page�� �ش��ϴ� ���ڵ� ����
		public int totalRecord(PagingVO pVO);	// �� ���ڵ� ��
		public BoardVO boardSelect(int no);	//	�ش� ���ڵ� ����
		public void hitCount(int no);	// ��ȸ�� ����
		public int boardUpdate(BoardVO vo);	// �Խ��� ����
		public int boardDelete(int no);		// �Խñ� ����

}
