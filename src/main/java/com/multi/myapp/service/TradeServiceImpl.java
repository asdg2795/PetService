package com.multi.myapp.service;

import com.multi.myapp.dto.TradeDetailResponseDto;
import com.multi.myapp.dto.TradeForm;
import com.multi.myapp.dto.TradeResponseDto;
import com.multi.myapp.dto.TradeUpdateDto;
import com.multi.myapp.mapper.ImageMapper;
import com.multi.myapp.mapper.TradeMapper;
import com.multi.myapp.vo.ImageVO;
import com.multi.myapp.vo.TradeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class TradeServiceImpl implements TradeService {

    @Autowired
    TradeMapper tradeMapper;

    @Autowired
    ImageService imageService;

    @Override
    public TradeDetailResponseDto findById(int no) {
        TradeVO tradeVO = tradeMapper.findById(no).orElseThrow(RuntimeException::new);
        ImageVO imageVO = imageService.findOne(no);

        return TradeDetailResponseDto.builder()
                .no(tradeVO.getNo())
                .address(tradeVO.getAddress())
                .title(tradeVO.getTitle())
                .content(tradeVO.getContent())
                .price(tradeVO.getPrice())
                .userid(tradeVO.getUserId())
                .writedate(tradeVO.getWritedate())
                .imagePath(imageVO.getStorefilename())
                .username(tradeVO.getUsername())
                .status(tradeVO.getStatus())
                .contact(tradeVO.getContact())
                .build();
    }

    @Override
    public List<TradeResponseDto> findAll(String tradeTitle) {
        List<TradeVO> list = tradeMapper.findAll(tradeTitle);
        List<TradeResponseDto> tradeResponseList = list.stream()
                .map(trade -> new TradeResponseDto(trade, imageService.findOne(trade.getNo()).getStorefilename()))
                .collect(Collectors.toList());
        return tradeResponseList;
    }

    @Override
    public int save(TradeForm tradeForm) {
        TradeVO tradeVO = TradeVO.builder()
                .title(tradeForm.getTitle())
                .price(tradeForm.getPrice())
                .content(tradeForm.getContent())
                .address(tradeForm.getAddress())
                .userId(tradeForm.getUserId())
                .username(tradeForm.getUsername())
                .contact(tradeForm.getContact())
                .build();

        tradeMapper.save(tradeVO);
        return tradeVO.getNo();
    }

    @Override
    public void update(int no, TradeUpdateDto tradeUpdateDto) {
        tradeMapper.update(no, tradeUpdateDto);
    }

    @Override
    public void delete(int no) {
        imageService.delete(no);
        tradeMapper.delete(no);
    }

    @Override
    public void updateStatus(int no, int status) {
        tradeMapper.updateStatus(no, status);
    }
}
