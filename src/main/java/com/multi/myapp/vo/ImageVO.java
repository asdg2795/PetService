package com.multi.myapp.vo;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Data
@Builder
public class ImageVO {

    private int id;
    private int tradeid;
    private String uploadfilename;
    private String storefilename;

    public void setTradeid(int tradeid) {
        this.tradeid = tradeid;
    }

}
