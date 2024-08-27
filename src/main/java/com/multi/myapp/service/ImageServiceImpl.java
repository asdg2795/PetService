package com.multi.myapp.service;

import com.multi.myapp.mapper.ImageMapper;
import com.multi.myapp.vo.ImageVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    ImageMapper imageMapper;

    @Override
    public void saveAll(int no, List<ImageVO> images) {
        if (CollectionUtils.isEmpty(images)) {
            return;
        }
        images.forEach(image -> image.setTradeid(no));
        imageMapper.saveAll(images);
    }

    @Override
    public List<ImageVO> findAll(int no) {
        return imageMapper.findAll(no);
    }

    @Override
    public ImageVO findOne(int no) {
        return imageMapper.findOne(no);
    }

    @Override
    public void delete(int no) {
        imageMapper.delete(no);
    }
}
