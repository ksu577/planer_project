package com.study.free.vo;

public class FreeBoardVO {
    private String id;
    private int freeNum;
    private String freeContext;
    private String createDate;
    private String updateDate;
    private int viewRate;
    private String freeCategory;
    private int freeLike;
    private String title;

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

    public String getFreeCategory() {
        return freeCategory;
    }

    public void setFreeCategory(String freeCategory) {
        this.freeCategory = freeCategory;
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
}
