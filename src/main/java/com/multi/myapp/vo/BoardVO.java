package com.multi.myapp.vo;

import lombok.AllArgsConstructor; 
import lombok.Data;
import lombok.NoArgsConstructor;

// @Getter		// ��� getter�����
// @Setter		// ��� setter�����
// @ToString	// toString() �������̵�
@NoArgsConstructor // �Ű����� ���� ������
@AllArgsConstructor // �Ű����� ��ü�� �ִ� ������

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
