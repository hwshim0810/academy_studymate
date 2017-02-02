package com.studymate.review.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studymate.review.model.ReviewDto;
import com.studymate.review.model.ReviewReplyDto;
import com.studymate.review.model.ReviewServiceImpl;

@Controller
public class ReviewController {
	@Autowired
	ReviewServiceImpl reviewService;
	
	@RequestMapping("reviewList")
	public String list(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		reviewService.list(session, model, currentPage, keyField, keyWord);
		return "/review/reviewMain";
	}
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("reviewDto", new ReviewDto());
		return "/review/reviewWriteForm";
	}
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	public String write(@Valid ReviewDto reviewDto, BindingResult result) {
		if (result.hasErrors())
			return "/review/reviewWriteForm";

		reviewService.write(reviewDto);
		return "redirect:/reviewList";
	}
	
	@RequestMapping("reviewRead")
	public String read(Model model, int borvNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		reviewService.read(model, borvNum, currentPage, update, keyField, keyWord);
		return "/review/reviewRead";
	}
	
	@RequestMapping(value = "reviewUpdate", method = RequestMethod.GET)
	public String update(Model model, int borvNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		reviewService.read(model, borvNum, currentPage, update, keyField, keyWord);
		return "/review/reviewUpdateForm";
	}
	
	@RequestMapping(value = "reviewUpdate", method = RequestMethod.POST)
	public String update(Model model ,@Valid ReviewDto reviewDto, int borvNum, int currentPage, BindingResult result) {
		if (result.hasErrors())
			return "/review/reviewUpdateForm";
		
		reviewService.update(model, reviewDto);
		return "redirect:/reviewRead?borvNum=" + borvNum + "&currentPage=" + currentPage + "&update=yes";
	}
	
	@RequestMapping(value = "reviewDelete", method = RequestMethod.GET)
	public String delete(ReviewDto reviewDto) {
		return "/review/reviewDeleteForm";
	}
	
	@RequestMapping(value = "reviewDelete", method = RequestMethod.POST)
	public String deleteHasReply(int borvNum, int currentPage) {
		String result = reviewService.deleteHasReply(borvNum, currentPage);
		return result;
	}
	
	@RequestMapping(value = "revReplyWrite", method = RequestMethod.POST)
	public String writeReply(@Valid ReviewReplyDto replyDto, BindingResult result, 
			int borvNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		if (result.hasErrors())
			return "/review/reviewRead";

		reviewService.writeReply(replyDto);
		return "redirect:/reviewRead?borvNum=" + borvNum + "&currentPage=" + currentPage + "&update=yes";
	}
	
	@RequestMapping("revReplyDelete")
	public String deleteReply(int borvNum, int currentPage, int repNum, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		
		reviewService.deleteReply(repNum);
		return "redirect:/reviewRead?borvNum=" + borvNum + "&currentPage=" + currentPage + "&update=yes";
	}
}
