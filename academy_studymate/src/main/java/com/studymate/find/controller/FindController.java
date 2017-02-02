package com.studymate.find.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studymate.find.model.FindDto;
import com.studymate.find.model.FindServiceImpl;

@Controller
public class FindController {
	@Autowired
	FindServiceImpl findService;
	
	@RequestMapping("findList")
	public String list(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		findService.list(session, model, currentPage, keyField, keyWord);
		return "/find/findMain";
	}
	
	@RequestMapping(value = "findWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("findDto", new FindDto());
		return "/find/findWriteForm";
	}
	
	@RequestMapping(value = "findWrite", method = RequestMethod.POST)
	public String write(@Valid FindDto findDto, BindingResult result) {
		if (result.hasErrors())
			return "/find/findWriteForm";

		findService.write(findDto);
		return "redirect:/findList";
	}
	
	@RequestMapping("findRead")
	public String read(Model model, int bofNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		findService.read(model, bofNum, currentPage, update, keyField, keyWord);
		return "/find/findRead";
	}
	
	@RequestMapping(value = "findUpdate", method = RequestMethod.GET)
	public String update(Model model, int bofNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		findService.read(model, bofNum, currentPage, update, keyField, keyWord);
		return "/find/findUpdateForm";
	}
	
	@RequestMapping(value = "findUpdate", method = RequestMethod.POST)
	public String update(Model model ,@Valid FindDto findDto, int bofNum, int currentPage, BindingResult result) {
		if (result.hasErrors())
			return "/find/findUpdateForm";
		
		findService.update(model, findDto);
		return "redirect:/findRead?bofNum=" + bofNum + "&currentPage=" + currentPage + "&update=yes";
	}
	
	@RequestMapping(value = "findDelete", method = RequestMethod.GET)
	public String delete(FindDto findDto) {
		return "/find/findDeleteForm";
	}
	
	@RequestMapping(value = "findDelete", method = RequestMethod.POST)
	public String delete(Model model, int bofNum, int currentPage) {
		findService.delete(model, bofNum);
		return "redirect:/findList?currentPage=" + currentPage;
	}
	
}
