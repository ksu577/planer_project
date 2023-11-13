package com.study.plan.vo;

import lombok.ToString;

@ToString
public class PlanVo {
    private String placeName;
    private String placeLoadAddress;
    private String placeAddress;
    private String planNum;

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
}
