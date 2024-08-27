package com.multi.myapp.vo;

import lombok.ToString;
/* 
offset = (�쁽�젣 �럹�씠吏� -1 )*�븳踰덉뿉 �몴�떆�븷 �젅肄붾뱶
limit = �븳踰덉뿉 �몴湲고븷 �젅肄붾뱶 �닔
*/

// �씠嫄곕뒗 Lombok�쑝濡� get set �옒�벉
// to string�� 媛��뒫
@ToString
public class GmemberPagingVO {
//	pvo�쓽 �뿭�솢 - �쟾泥닿��쓣 媛�吏�怨� �삤�뒗 寃껋씠 �븘�땲�씪 
//	�븯�굹�쓽 �떒�쐞濡� 臾띠뼱�꽌 媛��졇�삩�떎
	
	private int nowPage = 1;	//�쁽�옱�럹�씠吏�
	private int onePageRecord = 5;//�븳踰덉뿉 �몴�떆�븷 �젅肄붾뱶 �닔
	
	private int gmembertotalRecord;	//珥앸젅肄붾뱶 �닔
	private int totalPage; 		//珥앺럹�씠吏� �닔
	private String groupname;
	private int offsetPoint;// 0 DB �젅肄붾뱶 �꽑�깮�떆 �떆�옉�쐞移�
	
	//�럹�씠吏� �꽆踰꾨쭅
	private int onePageCount = 5; // �븳踰덉뿉 異쒕젰�븷 �럹�씠吏� 媛��닔
	private int startPage=1;//�떆�옉�럹�씠吏� 踰덊샇 ( 1,2,3,4,5 )   ( 6,7,8,9,10 )
	//getter //setter
	private String searchWord;
	private String searchKey;
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		// �빐�떦�럹�씠吏� �쐞移섎�� 怨꾩궛
		this.offsetPoint = (nowPage-1)*this.onePageRecord;
		
		//�떆�옉 �럹�씠吏� : �쁽�옱�럹�씠吏� 踰덊샇媛� 諛붾�붾븣
		this.startPage = (nowPage-1)/this.onePageRecord*this.onePageRecord+1;// �씠嫄� 10�떒�쐞濡� �븯硫� 踰꾨┝�씠�옉 �듅�젙�옄由우닔 踰꾨┝�씠�옉 媛숈� �끉由щ떎.
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return gmembertotalRecord;
	}

	public void setTotalRecord(int gmembertotalRecord) {
		this.gmembertotalRecord = gmembertotalRecord;
		// 珥앺럹�씠吏��닔
		totalPage = (int) Math.ceil( gmembertotalRecord / (double)onePageRecord);
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

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	
	
	
}
