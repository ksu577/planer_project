package com.study.plan.vo;

import lombok.ToString;

@ToString
public class TourVO {
    private String id;
    private int planNum;
    private String planTitle;
    private String regDate;

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPlanNum() {
        return planNum;
    }

    public void setPlanNum(int planNum) {
        this.planNum = planNum;
    }

    public String getPlanTitle() {
        return planTitle;
    }

    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }
}
