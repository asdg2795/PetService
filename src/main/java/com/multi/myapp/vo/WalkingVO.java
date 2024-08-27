package com.multi.myapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WalkingVO {
	private String userid;
	private int no;
	private String walkingname;
	private String walkingimg;
	private String content;
	private String hashtag;
	private String writedate;
	private String startarea;
	private String endarea;
	private int people;
	private String category;
	private String applyid;
	private String applyname;
	private String coursename;
	
}
