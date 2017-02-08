package com.studymate.review.controller;

import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.studymate.review.model.ReviewDto;
import com.studymate.review.model.ReviewReplyDto;
import com.studymate.review.model.ReviewServiceImpl;

@Controller
public class ReviewController {
	@Autowired
	ReviewServiceImpl reviewService;
	
	@RequestMapping("reviewList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		reviewService.list(session, model, currentPage, keyField, keyWord);
		return "/review/reviewMain";
	}
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.GET)
	public String write(Model model) {
		reviewService.writeForm(model);
		return "/review/reviewWriteForm";
	}
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	public String write(@Valid ReviewDto reviewDto, BindingResult result) {
		if (result.hasErrors())
			return "/review/reviewWriteForm";

		reviewService.write(reviewDto);
		return "redirect:/reviewList/1";
	}
	
	@RequestMapping("reviewRead/{currentPage}-{borvNum}")
	public String read(Model model, 
			@PathVariable("borvNum") int borvNum, 
			@PathVariable("currentPage") int currentPage, String update,
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
		return "redirect:/reviewRead/" + currentPage + "-" + borvNum  +"?update=y";
	}
	
	@RequestMapping(value = "reviewDelete/{currentPage}", method = RequestMethod.GET)
	public String delete(Model model, ReviewDto reviewDto, @PathVariable("currentPage") int currentPage) {
		reviewService.setCurrentPage(model, currentPage);
		return "/review/reviewDeleteForm";
	}
	
	@RequestMapping(value = "reviewDelete/{currentPage}", method = RequestMethod.POST)
	public String deleteHasReply(int borvNum, @PathVariable("currentPage") int currentPage) {
		String result = reviewService.deleteHasReply(borvNum, currentPage);
		return result;
	}
	
	@RequestMapping(value = "revReplyList", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> listReply(int replyPage, int borvNum) {
		HashMap<String, Object> resultmap = reviewService.listReply(replyPage, borvNum);
		return resultmap;
	}
	
	@RequestMapping(value = "revReplyWrite", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> writeReply(ReviewReplyDto replyDto, int replyPage) {
		HashMap<String, Object> resultmap = reviewService.writeReply(replyDto, replyPage);
		return resultmap;
	}
	
	@RequestMapping("reviewRead/revReplyDelete/{currentPage}-{borvNum}-{repNum}-{update}")
	public String deleteReply(@PathVariable("currentPage") int currentPage, 
			@PathVariable("borvNum") int borvNum,  
			@PathVariable("repNum") int repNum, 
			@PathVariable("update") String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		
		reviewService.deleteReply(borvNum, repNum);
		return "redirect:/reviewRead/" + currentPage + "-" + borvNum  +"-" + update;
	}
}
