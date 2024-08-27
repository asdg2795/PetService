package com.multi.myapp.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class TradeDetailResponseDto {

    private String userid;
    private int no;
    private String address;
    private LocalDate writedate;
    private int price;
    private String title;
    private String content;
    private String username;
    private String contact;
    private int status;

    private String imagePath;

    @Builder
    public TradeDetailResponseDto(String userid, int no, String address, LocalDate writedate, int price, String title,
                                  String content, String imagePath, String username, int status, String contact) {
        this.userid = userid;
        this.no = no;
        this.address = address;
        this.writedate = writedate;
        this.price = price;
        this.title = title;
        this.content = content;
        this.imagePath = imagePath;
        this.username = username;
        this.status = status;
        this.contact = contact;
    }
}
