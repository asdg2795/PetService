package com.multi.myapp.mapper;

import com.multi.myapp.dto.TradeUpdateDto;
import com.multi.myapp.vo.TradeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface TradeMapper {

    void save(TradeVO tradeVO);

    void update(@Param("no") int no, @Param("updateParam") TradeUpdateDto tradeUpdateDto);
   

    Optional<TradeVO> findById(int id);
    
    // Search 異붽�
    List<TradeVO> findAll(String tradeTitle);

    void delete(int no);

    void updateStatus(@Param("no") int no, @Param("status") int status);
}
