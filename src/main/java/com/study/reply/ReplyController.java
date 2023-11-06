package com.study.reply;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestController
public class ReplyController {

    @    @RequestMapping(value = "/reply/replyList.wow")
public Map<String, Objects> replyList()


    @ResponseBody
    @RequestMapping(value = "/reply/replyList.wow")
    public List<ReplyVO> replyList(){
        List<ReplyVO> replyList=getReplyList();
        return replyList;

    }
}
