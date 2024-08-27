package com.multi.myapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseVO {
	private String coursename;
	private int courseno;
	private String startarea;
	private String endarea;
	private String userid;
}
