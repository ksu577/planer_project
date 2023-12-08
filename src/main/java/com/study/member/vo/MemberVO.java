package com.study.member.vo;

import lombok.Data;


@Data
public class MemberVO {

    private String Id;         /* 회원 아이디 */
    private String password;       /* 회원 비밀번호 */
    private String name;       /* 회원 이름 */
    private String birth;        /* 회원 생일 */
    private String address;        /* 주소 */
    private String address2;        /* 성세 주소 */
    private String phnum;         /* 연락처 */
    private String email;       /* 이메일 */
    private String delYn;   /* 삭제여부 */
    private String createDate; /* 가입일 */
    private String role;   /* 어드민 */
    private String profile;     /* 프로필사진 */
}
