package com.multi.myapp.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.multi.myapp.vo.BoardVO;
import com.multi.myapp.vo.PagingVO;

@Mapper
public interface BoardMapper {
		public int boardInsert(BoardVO vo);
		public List<BoardVO> boardPageList(PagingVO pVO); // page�� �ش��ϴ� ���ڵ� ����
		public int totalRecord(PagingVO pVO);	// �� ���ڵ� ��
		public BoardVO boardSelect(int no);	//	�ش� ���ڵ� ����
		public void hitCount(int no);	// ��ȸ�� ����
		public int boardUpdate(BoardVO vo);	// �Խ��� ����
		public int boardDelete(int no);		// �Խñ� ����

}
