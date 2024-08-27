package com.multi.myapp.dto;

import com.multi.myapp.vo.ImageVO;
import com.multi.myapp.vo.TradeVO;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class TradeResponseDto {
    private int no;
    private String title;
    private String address;
    private int price;
    private int status;
    private String imagePath;

    public TradeResponseDto(int no, String title, String address, int price, int status) {
        this.no = no;
        this.title = title;
        this.address = address;
        this.price = price;
        this.status = status;
    }

    public TradeResponseDto(TradeVO tradeVO, String imagePath) {
        this.no = tradeVO.getNo();
        this.title = tradeVO.getTitle();
        this.address = tradeVO.getAddress();
        this.price = tradeVO.getPrice();
        this.status = tradeVO.getStatus();
        this.imagePath = imagePath;
    }
}
