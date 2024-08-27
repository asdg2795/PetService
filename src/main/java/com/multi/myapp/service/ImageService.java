package com.multi.myapp.service;

import com.multi.myapp.vo.ImageVO;

import java.util.List;

public interface ImageService {
    void saveAll(int no, List<ImageVO> images);

    List<ImageVO> findAll(int no);

    ImageVO findOne(int no);

    void delete(int no);
}
