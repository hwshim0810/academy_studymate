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
	
	@RequestMapping("qnalist/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.list(session, model, currentPage, keyField, keyWord);
		return "/qna/qnaMain";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("qnaDto", new QnaDto());
		return "/qna/qnaWriteForm";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public String write(@Valid QnaDto qnaDto, BindingResult result) {
		if (result.hasErrors())
			return "/qna/qnaWriteForm";

		qnaService.write(qnaDto);
		return "redirect:/qnalist/1";
	}
	
	@RequestMapping("qnaRead")
	public String read(Model model, int bonNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.read(model, bonNum, currentPage, update, keyField, keyWord);
		return "/qna/qnaRead";
	}
	
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public String update(Model model, int boqNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.read(model, boqNum, currentPage, update, keyField, keyWord);
		return "/qna/qnaUpdateForm";
	}
	
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public String update(Model model ,QnaDto qnaDto, int boqNum, int currentPage) {
		qnaService.update(model, qnaDto);
		return "redirect:/qnaRead/" + currentPage + "-"  + boqNum + "?update=y";
	}
	
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public String delete(QnaDto qnaDto) {
		return "/qna/qnaDeleteForm";
	}
	
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public String deleteQna(Model model, int boqGroupnum, int boqNum, int currentPage) {
		String page = qnaService.deleteQna(model, boqGroupnum, boqNum, currentPage);
		return page;
	}
	
	@RequestMapping(value = "qnaComment", method = RequestMethod.GET)
	public String writeComment(Model model, int boqNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		qnaService.read(model, boqNum, currentPage, update, keyField, keyWord);
		return "/qna/qnaCommentForm";
	}
	
	@RequestMapping(value = "qnaComment", method = RequestMethod.POST)
	public String writeComment(@Valid QnaDto qnaDto, BindingResult result) {
		if (result.hasErrors())
			return "/qna/qnaCommentForm";

		qnaService.writeComment(qnaDto);
		return "redirect:/qnalist/1";
	}
}
