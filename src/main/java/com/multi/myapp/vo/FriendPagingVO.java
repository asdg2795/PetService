package com.multi.myapp.vo;

import lombok.ToString;
/* 
offset = (현제 페이지 -1 )*한번에 표시할 레코드
limit = 한번에 표기할 레코드 수
*/

// 이거는 Lombok으로 get set 힘듬
// to string은 가능
@ToString
public class FriendPagingVO {
//	pvo의 역활 - 전체글을 가지고 오는 것이 아니라 
//	하나의 단위로 묶어서 가져온다
	
	private int nowPage = 1;	//현재페이지
	private int onePageRecord = 5;//한번에 표시할 레코드 수
	
	private int friendtotalRecord;	//총레코드 수
	private int totalPage; 		//총페이지 수
	
	private int offsetPoint;// 0 DB 레코드 선택시 시작위치
	
	//페이지 넘버링
	private int onePageCount = 5; // 한번에 출력할 페이지 갯수
	private int startPage=1;//시작페이지 번호 ( 1,2,3,4,5 )   ( 6,7,8,9,10 )
	//getter //setter
	private String searchWord;
	private String searchKey;
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		// 해당페이지 위치를 계산
		this.offsetPoint = (nowPage-1)*this.onePageRecord;
		
		//시작 페이지 : 현재페이지 번호가 바뀔때
		this.startPage = (nowPage-1)/this.onePageRecord*this.onePageRecord+1;// 이걸 10단위로 하면 버림이랑 특정자릿수 버림이랑 같은 논리다.
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return friendtotalRecord;
	}

	public void setTotalRecord(int friendtotalRecord) {
		this.friendtotalRecord = friendtotalRecord;
		// 총페이지수
		totalPage = (int) Math.ceil( friendtotalRecord / (double)onePageRecord);
		/*
		 * System.out.println("totalPage : "+totalPage);
		 * System.out.println("totalRecord : "+totalRecord);
		 * System.out.println("onePageRecord : "+onePageRecord);
		 * System.out.println("this.totalPage : "+this.totalPage);
		 */
	}
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage=totalPage;
	}

	public int getOffsetPoint() {
		return offsetPoint;
	}

	public void setOffsetPoint(int offsetPoint) {
		this.offsetPoint = offsetPoint;
	}

	public int getonePageCount() {
		return onePageCount;
	}

	public void setonePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	
	
	
}
