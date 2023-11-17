package com.study.comment.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CommentVO {
    private String id;
    private int freeNum;
    private int freeBoardCommentNumber;
    private String createDate;
    private String freeContextComment;
    private String  updateDate;

    private int freeCommentLike;



    public String toString(){
        return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
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

    public int getFreeBoardCommentNumber() {
        return freeBoardCommentNumber;
    }

    public void setFreeBoardCommentNumber(int freeBoardCommentNumber) {
        this.freeBoardCommentNumber = freeBoardCommentNumber;
    }


    public String getFreeContextComment() {
        return freeContextComment;
    }

    public void setFreeContextComment(String freeContextComment) {
        this.freeContextComment = freeContextComment;
    }



    public int getFreeCommentLike() {
        return freeCommentLike;
    }

    public void setFreeCommentLike(int freeCommentLike) {
        this.freeCommentLike = freeCommentLike;
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
}