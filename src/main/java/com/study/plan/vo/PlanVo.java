package com.study.plan.vo;

import lombok.ToString;

@ToString
public class PlanVo {
    private String id;
    private int planNum;
    private int placeNum;
    private String placeName;
    private String xlab;
    private String ylab;
    private String placeAddress;
    private String startDate;
    private String endDate;
    private int dayCount;
    private String placeLoadAddress;
    private String planHp;
    private String planTitle;

    private int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getPlanTitle() {
        return planTitle;
    }

    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }

    public int getPlaceNum() {
        return placeNum;
    }

    public void setPlaceNum(int placeNum) {
        this.placeNum = placeNum;
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

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
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

    public String getPlaceAddress() {
        return placeAddress;
    }

    public void setPlaceAddress(String placeAddress) {
        this.placeAddress = placeAddress;
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

    public int getDayCount() {
        return dayCount;
    }

    public void setDayCount(int dayCount) {
        this.dayCount = dayCount;
    }

    public String getPlaceLoadAddress() {
        return placeLoadAddress;
    }

    public void setPlaceLoadAddress(String placeLoadAddress) {
        this.placeLoadAddress = placeLoadAddress;
    }

    public String getPlanHp() {
        return planHp;
    }

    public void setPlanHp(String planHp) {
        this.planHp = planHp;
    }
}