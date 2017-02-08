package com.studymate.notice.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studymate.notice.model.NoticeDto;
import com.studymate.notice.model.NoticeServiceImpl;

@Controller
public class NoticeController {
	@Autowired
	NoticeServiceImpl noticeService;
	
	@RequestMapping("noticeList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		noticeService.list(session, model, currentPage, keyField, keyWord);
		return "/notice/noticeMain";
	}
	
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public String write(Model model) {
		noticeService.writeForm(model);
		return "/notice/noticeWriteForm";
	}
	
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public String write(@Valid NoticeDto noticeDto, BindingResult result) {
		if (result.hasErrors())
			return "/notice/noticeWriteForm";

		noticeService.write(noticeDto);
		return "redirect:/noticeList/1";
	}
	
	@RequestMapping("noticeRead/{currentPage}-{bonNum}")
	public String read(Model model, 
			@PathVariable("bonNum") int bonNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		noticeService.read(model, bonNum, currentPage, update, keyField, keyWord);
		return "/notice/noticeRead";
	}
	
	@RequestMapping(value = "noticeUpdate/{currentPage}-{bonNum}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("bonNum") int bonNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		noticeService.read(model, bonNum, currentPage, update, keyField, keyWord);
		return "/notice/noticeUpdateForm";
	}
	
	@RequestMapping(value = "noticeUpdate/{currentPage}", method = RequestMethod.POST)
	public String update(Model model ,NoticeDto noticeDto, int bonNum, 
			@PathVariable("currentPage") int currentPage) {
		noticeService.update(model, noticeDto);
		return "redirect:/noticeRead/" + currentPage + "-" + bonNum + "?update=y";
	}
	
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public String delete(Model model, NoticeDto noticeDto, int currentPage) {
		noticeService.setCurrentPage(model, currentPage);
		return "/notice/noticeDeleteForm";
	}
	
	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	public String delete(Model model,  int bonNum, int currentPage) {
		noticeService.delete(model, bonNum);
		return "redirect:/noticeList/" + currentPage;
	}
	
}
