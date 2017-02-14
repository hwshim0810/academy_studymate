package com.studymate.find.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studymate.find.model.FindServiceImpl;
import com.studymate.find.model.FindStudyDto;

public class FindStudyController {
	FindServiceImpl findService;
	
	@RequestMapping("findList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		findService.list(session, model, currentPage, keyField, keyWord);
		return "/find/findMain";
	}
	
	@RequestMapping(value = "findWrite", method = RequestMethod.GET)
	public String write(Model model) {
		findService.writeForm(model);
		return "/find/findWriteForm";
	}
	
	@RequestMapping(value = "findWrite", method = RequestMethod.POST)
	public String write(HttpSession session, Model model, 
			@Valid FindStudyDto findStudyDto, BindingResult result, @RequestParam(required = false) String mailCheck) {
		if (result.hasErrors())
			return "/find/findWriteForm";

		String page = findService.writeNsendEmail(session, model, findStudyDto, mailCheck);
		return page;
	}
	
	@RequestMapping("findRead/{currentPage}-{findNum}")
	public String read(Model model, 
			@PathVariable("findNum") int findNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		findService.read(model, findNum, currentPage, update, keyField, keyWord);
		return "/find/findRead";
	}
	
	@RequestMapping(value = "findUpdate/{currentPage}-{findNum}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("findNum") int findNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		findService.read(model, findNum, currentPage, update, keyField, keyWord);
		return "/find/findUpdateForm";
	}
	
	@RequestMapping(value = "findUpdate/{currentPage}-{findNum}", method = RequestMethod.POST)
	public String update(HttpSession session ,@Valid FindStudyDto findStudyDto, BindingResult result,
			@PathVariable("findNum") int findNum, 
			@PathVariable("currentPage") int currentPage) {
		if (result.hasErrors())
			return "/find/findUpdateForm";
		
		String page = findService.updateRes(session, findStudyDto, currentPage, findNum);
		return page;
	}
	
	@RequestMapping(value = "findDelete/{currentPage}-{findNum}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("findNum") int findNum, 
			@PathVariable("currentPage") int currentPage) {
		findService.setCurrentPage(model, currentPage, findNum);
		return "/find/findDeleteForm";
	}
	
	@RequestMapping(value = "findDelete", method = RequestMethod.POST)
	public String delete(Model model, FindStudyDto findStudyDto, int currentPage) {
		findService.delete(model, findStudyDto);
		return "redirect:/reserveList/" + currentPage;
	}
	
	@RequestMapping(value = "getBorName", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> getBorName(int borNum) {
		 return findService.getBorName(borNum);
	}
	
}
