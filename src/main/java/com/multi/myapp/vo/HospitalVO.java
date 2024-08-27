package com.multi.myapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalVO {
	private int no;
	private String areaname;
	private String userid;
	private String hospitalImg;
	private String content;
	private float star;
	private String writedate;
	private String addr;
	private String tel;
	private String hosImg;	
	
}
