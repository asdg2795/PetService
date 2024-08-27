package com.multi.myapp.vo;

import lombok.AllArgsConstructor; 
import lombok.Data;
import lombok.NoArgsConstructor;

// @Getter		// 모든 getter만들기
// @Setter		// 모든 setter만들기
// @ToString	// toString() 오버라이딩
@NoArgsConstructor // 매개변수 없는 생성자
@AllArgsConstructor // 매개변수 전체가 있는 생성자

@Data // Getter, Setter, toString
public class BoardVO {
	private int no;
	private String subject;
	private String content;
	private String userid;
	private int hit;
	private int like;
	private String writedate;



}
