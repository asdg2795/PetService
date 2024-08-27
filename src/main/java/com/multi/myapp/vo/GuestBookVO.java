package com.multi.myapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GuestBookVO {
	private int no;
	private String userid;
	private int replyno;
	private String comment;
	private String writedate;
}
