package com.multi.myapp.dto;

import lombok.Data; 
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Data
public class TradeUpdateDto {
    private String title;
    private int price;
    private String content;
    private String address;
    private String contact;
    private List<MultipartFile> files = new ArrayList<>();

    public TradeUpdateDto() {
    }

    public TradeUpdateDto(String title, int price, String content, String address, String contact) {
        this.title = title;
        this.price = price;
        this.content = content;
        this.address = address;
        this.contact = contact;
    }
}
