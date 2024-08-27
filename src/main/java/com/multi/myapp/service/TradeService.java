package com.multi.myapp.service;

import com.multi.myapp.dto.TradeDetailResponseDto;
import com.multi.myapp.dto.TradeForm;
import com.multi.myapp.dto.TradeResponseDto;
import com.multi.myapp.dto.TradeUpdateDto;
import com.multi.myapp.vo.TradeVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TradeService {
    public List<TradeResponseDto> findAll(String tradeTitle);

    int save(TradeForm tradeForm);

    TradeDetailResponseDto findById(int no);

    void update(int no, TradeUpdateDto tradeUpdateDto);

    void delete(int no);

    void updateStatus(int no, int status);

}
