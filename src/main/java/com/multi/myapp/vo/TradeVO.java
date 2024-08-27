package com.multi.myapp.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
@Builder
@Data
@RequiredArgsConstructor
public class TradeVO {
    private String userId;
    private int no;
    private int hit;
    private String title;
    private int like;
    private String content;
    private String contact;
    private LocalDate writedate;
    private String address;
    private int price;
    private int status;
    private String username;
}
