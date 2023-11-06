package com.study.reply;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReplyVO {
    private int recoNu; //글 번호, DB에서 FreeBoard Comment Number

    private  int reParentNo; // 부모 번호, DB에서 FreeNum

    private String reMemid; //작성자 아이디, DB에서 ID

    private String reContent; // 댓글 내용, DB에서 Free Context Comment

    private String reRegDate; // 댓글 등록일자, CreateDate

    private String reModDate; // 댓글 수정일자, updateDate

    private int reLike; // 좋아요 수, DB에서 Comment Like

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public int getRecoNu() {
        return recoNu;
    }

    public void setRecoNu(int recoNu) {
        this.recoNu = recoNu;
    }

    public int getReParentNo() {
        return reParentNo;
    }

    public void setReParentNo(int reParentNo) {
        this.reParentNo = reParentNo;
    }

    public String getReMemid() {
        return reMemid;
    }

    public void setReMemid(String reMemid) {
        this.reMemid = reMemid;
    }

    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent;
    }

    public String getReRegDate() {
        return reRegDate;
    }

    public void setReRegDate(String reRegDate) {
        this.reRegDate = reRegDate;
    }

    public String getReModDate() {
        return reModDate;
    }

    public void setReModDate(String reModDate) {
        this.reModDate = reModDate;
    }

    public int getReLike() {
        return reLike;
    }

    public void setReLike(int reLike) {
        this.reLike = reLike;
    }
}
