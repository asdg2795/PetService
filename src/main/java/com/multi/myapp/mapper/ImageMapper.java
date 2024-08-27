package com.multi.myapp.mapper;

import com.multi.myapp.vo.ImageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface ImageMapper {

    /**
     * 紐⑤뱺 �씠誘몄� ���옣
     * @param images - �씠誘몄� 由ъ뒪�듃
     */
    void saveAll(List<ImageVO> images);

    /**
     *  紐⑤뱺 �뙆�씪 李얘린
     * @param no - trade 踰덊샇 (FK)
     * @return ImageList
     */
    List<ImageVO> findAll(int no);

    ImageVO findOne(int no);

    void delete(int no);
}
