package com.study.product.vo;

import lombok.ToString;

@ToString
public class SaveCartVO {
    private String userId;
    private int saveNum;
    private String takeName;
    private String takeHp;
    private int takeMail;
    private String takeAdd;
    private String takeDetailAdd;
    private String takeAutoAdd;
    private String takeReq;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getSaveNum() {
        return saveNum;
    }

    public void setSaveNum(int saveNum) {
        this.saveNum = saveNum;
    }

    public String getTakeName() {
        return takeName;
    }

    public void setTakeName(String takeName) {
        this.takeName = takeName;
    }

    public String getTakeHp() {
        return takeHp;
    }

    public void setTakeHp(String takeHp) {
        this.takeHp = takeHp;
    }

    public int getTakeMail() {
        return takeMail;
    }

    public void setTakeMail(int takeMail) {
        this.takeMail = takeMail;
    }

    public String getTakeAdd() {
        return takeAdd;
    }

    public void setTakeAdd(String takeAdd) {
        this.takeAdd = takeAdd;
    }

    public String getTakeDetailAdd() {
        return takeDetailAdd;
    }

    public void setTakeDetailAdd(String takeDetailAdd) {
        this.takeDetailAdd = takeDetailAdd;
    }

    public String getTakeAutoAdd() {
        return takeAutoAdd;
    }

    public void setTakeAutoAdd(String takeAutoAdd) {
        this.takeAutoAdd = takeAutoAdd;
    }

    public String getTakeReq() {
        return takeReq;
    }

    public void setTakeReq(String takeReq) {
        this.takeReq = takeReq;
    }
}
