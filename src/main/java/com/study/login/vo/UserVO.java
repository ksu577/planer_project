package com.study.login.vo;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@Data
public class UserVO {
    private String Id;
    private String name;
    private String password;
    private String role;

    public UserVO(String Id, String name, String password, String role) {
        this.Id = Id;
        this.name = name;
        this.password = password;
        this.role = role;
    }


}
