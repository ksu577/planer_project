package com.study.free.web;

import java.util.List;

import javax.inject.Inject;

import com.study.free.dao.IFreeBoardDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.free.vo.FreeBoardVO;

@Controller
public class FreeController {

    @Inject
    IFreeBoardDao freeBoardDao;

    @RequestMapping("/free/freeList.wow")
    public String freeList(Model model) {
        List<FreeBoardVO> freeBoardList = freeBoardDao.getBoardList();
        model.addAttribute("freeBoardList", freeBoardList);
        return "free/freeList";
    }

    @RequestMapping("/free/freeView.wow")
    public String freeView(Model model, int freeNum) {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(freeNum);
        model.addAttribute("freeBoard", freeBoard);
        return "free/freeView";
    }

    @RequestMapping("/free/freeEdit.wow")
    public String freeEdit(Model model, int boNo) {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(boNo);
        model.addAttribute("freeBoard", freeBoard);
        return "free/freeEdit";
    }

    @RequestMapping("/free/freeModify.wow")
    public String freeModify(@ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
        freeBoardDao.updateBoard(freeBoard);
        return "free/freeModify";
    }

    @RequestMapping("/free/freeDelete.wow")
    public String freeDelete(@ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
        freeBoardDao.deleteBoard(freeBoard);
        return "free/freeDelete";
    }

    @RequestMapping("/free/freeForm.wow")
    public String freeForm() {
        return "free/freeForm";
    }

    @RequestMapping("/free/freeRegist.wow")
    public String freeEdit(@ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
        freeBoardDao.insertBoard(freeBoard);
        return "free/freeRegist";
    }


}