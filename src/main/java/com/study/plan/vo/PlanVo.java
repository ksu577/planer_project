package com.study.plan.vo;

import lombok.ToString;

@ToString
public class PlanVo {
    private String placeName;
    private String placeLoadAddress;
    private String placeAddress;
    private String planNum;
    private String xlab;
    private String ylab;
    private int totalDay;
    private String startDate;
    private String endDate;

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getPlaceLoadAddress() {
        return placeLoadAddress;
    }

    public void setPlaceLoadAddress(String placeLoadAddress) {
        this.placeLoadAddress = placeLoadAddress;
    }

    public String getPlaceAddress() {
        return placeAddress;
    }

    public void setPlaceAddress(String placeAddress) {
        this.placeAddress = placeAddress;
    }

    public String getPlanNum() {
        return planNum;
    }

    public void setPlanNum(String planNum) {
        this.planNum = planNum;
    }

    public String getXlab() {
        return xlab;
    }

    public void setXlab(String xlab) {
        this.xlab = xlab;
    }

    public String getYlab() {
        return ylab;
    }

    public void setYlab(String ylab) {
        this.ylab = ylab;
    }

    public int getTotalDay() {
        return totalDay;
    }

    public void setTotalDay(int totalDay) {
        this.totalDay = totalDay;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
