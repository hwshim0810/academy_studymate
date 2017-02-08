package com.studymate.qna.controller;

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

import com.studymate.qna.model.QnaDto;
import com.studymate.qna.model.QnaServiceImpl;

@Controller
public class QnaController {
	@Autowired
	QnaServiceImpl qnaService;
	
	@RequestMapping("qnaList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.list(session, model, currentPage, keyField, keyWord);
		return "/qna/qnaMain";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public String write(Model model) {
		qnaService.writeForm(model);
		return "/qna/qnaWriteForm";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public String write(@Valid QnaDto qnaDto, BindingResult result) {
		if (result.hasErrors())
			return "/qna/qnaWriteForm";

		qnaService.write(qnaDto);
		return "redirect:/qnaList/1";
	}
	
	@RequestMapping("qnaRead/{currentPage}-{boqNum}")
	public String read(Model model, 
			@PathVariable("boqNum") int boqNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.read(model, boqNum, currentPage, update, keyField, keyWord);
		return "/qna/qnaRead";
	}
	
	@RequestMapping(value = "qnaUpdate/{currentPage}-{boqNum}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("boqNum") int boqNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.read(model, boqNum, currentPage, update, keyField, keyWord);
		return "/qna/qnaUpdateForm";
	}
	
	@RequestMapping(value = "qnaUpdate/{currentPage}-{boqNum}", method = RequestMethod.POST)
	public String update(Model model ,@Valid QnaDto qnaDto, 
			@PathVariable("boqNum") int boqNum, 
			@PathVariable("currentPage") int currentPage, BindingResult result) {
		qnaService.update(model, qnaDto);
		return "redirect:/qnaRead/" + currentPage + "-"  + boqNum + "?update=y";
	}
	
	@RequestMapping(value = "qnaDelete/{currentPage}-{boqNum}-{boqGroupnum}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("boqNum") int boqNum, 
			@PathVariable("boqGroupnum") int boqGroupnum,
			@PathVariable("currentPage") int currentPage) {
		qnaService.setCurrentPage(model, currentPage, boqNum);
		return "/qna/qnaDeleteForm?gNum=" + boqGroupnum;
	}
	
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public String deleteQna(Model model, int boqGroupnum, int boqNum, int currentPage) {
		String page = qnaService.deleteQna(model, boqGroupnum, boqNum, currentPage);
		return page;
	}
	
	@RequestMapping(value = "qnaComment/{currentPage}-{boqNum}", method = RequestMethod.GET)
	public String writeComment(Model model,
			@PathVariable("boqNum") int boqNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.read(model, boqNum, currentPage, update, keyField, keyWord);
		return "/qna/qnaCommentForm";
	}
	
	@RequestMapping(value = "qnaComment/{currentPage}", method = RequestMethod.POST)
	public String writeComment(@Valid QnaDto qnaDto, BindingResult result, 
			@PathVariable("currentPage") int currentPage) {
		if (result.hasErrors())
			return "/qna/qnaCommentForm";

		qnaService.writeComment(qnaDto);
		return "redirect:/qnaList/" + currentPage;
	}
}
