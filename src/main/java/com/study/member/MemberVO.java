package com.study.member;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberVO {

    private String memId;         /* 회원 아이디 */
    private String memPass;       /* 회원 비밀번호 */
    private String memName;       /* 회원 이름 */
    private String memBir;        /* 회원 생일 */
    private String memAdd;        /* 주소 */
    private String memHp;         /* 연락처 */
    private String memMail;       /* 이메일 */
    private boolean isAdmin; // 어드민 여부를 나타내는 플래그

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPass() {
        return memPass;
    }

    public void setMemPass(String memPass) {
        this.memPass = memPass;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemBir() {
        return memBir;
    }

    public void setMemBir(String memBir) {
        this.memBir = memBir;
    }

    public String getMemAdd() {
        return memAdd;
    }

    public void setMemAdd(String memAdd) {
        this.memAdd = memAdd;
    }

    public String getMemHp() {
        return memHp;
    }

    public void setMemHp(String memHp) {
        this.memHp = memHp;
    }

    public String getMemMail() {
        return memMail;
    }

    public void setMemMail(String memMail) {
        this.memMail = memMail;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}
