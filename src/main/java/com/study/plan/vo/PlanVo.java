package com.study.plan.vo;

public class PlanVo {
    private String id;
    private int plannum;
    private String placeName;
    private int xLab;
    private int yLab;
    private String placeAddress;
    private String startDate;
    private String endDate;
    private int totalDay;
    private int day;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPlannum() {
        return plannum;
    }

    public void setPlannum(int plannum) {
        this.plannum = plannum;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public int getxLab() {
        return xLab;
    }

    public void setxLab(int xLab) {
        this.xLab = xLab;
    }

    public int getyLab() {
        return yLab;
    }

    public void setyLab(int yLab) {
        this.yLab = yLab;
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

    public int getTotalDay() {
        return totalDay;
    }

    public void setTotalDay(int totalDay) {
        this.totalDay = totalDay;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }
}
