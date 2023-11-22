package com.study.free.vo;

import com.study.attach.vo.AttachVO;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

public class FreeBoardVO {


    private String id;
    private int freeNum;
    private String freeContext;
    private String createDate;
    private String updateDate;
    private int viewRate;
    private int freeLike;
    private String title;
    private String boDelYn;
    private String thumbnailImagePath;
    private String notice;

    private List<AttachVO> attaches;

    private  int[] delAtchNos;

    public List<AttachVO> getAttaches() {
        return attaches;
    }
    public void setAttaches(List<AttachVO> attaches) {
        this.attaches = attaches;
    }

    public int[] getDelAtchNos() {
        return delAtchNos;
    }

    public void setDelAtchNos(int[] delAtchNos) {
        this.delAtchNos = delAtchNos;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getBoDelYn() {
        return boDelYn;
    }

    public void setBoDelYn(String boDelYn) {
        this.boDelYn = boDelYn;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getFreeNum() {
        return freeNum;
    }

    public void setFreeNum(int freeNum) {
        this.freeNum = freeNum;
    }

    public String getFreeContext() {
        return freeContext;
    }

    public void setFreeContext(String freeContext) {
        this.freeContext = freeContext;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public int getViewRate() {
        return viewRate;
    }

    public void setViewRate(int viewRate) {
        this.viewRate = viewRate;
    }


    public int getFreeLike() {
        return freeLike;
    }

    public void setFreeLike(int freeLike) {
        this.freeLike = freeLike;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnailImagePath() {
        return thumbnailImagePath;
    }

    public void setThumbnailImagePath(String thumnailImagePath) {
        this.thumbnailImagePath = thumnailImagePath;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }
}
