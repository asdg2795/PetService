package com.multi.myapp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String userid;
	private String userpwd;
	private String username;
	private String tel;
	private String email;
	private String addr;
}
