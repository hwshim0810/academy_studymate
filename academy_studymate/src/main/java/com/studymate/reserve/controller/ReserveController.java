package com.studymate.reserve.controller;

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

import com.studymate.reserve.model.ReserveDto;
import com.studymate.reserve.model.ReserveServiceImpl;

@Controller
public class ReserveController {
	@Autowired
	ReserveServiceImpl resService;
	
	@RequestMapping("reserveList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		resService.list(session, model, currentPage, keyField, keyWord);
		return "/reserve/reserveMain";
	}
	
	@RequestMapping(value = "reserveWrite", method = RequestMethod.GET)
	public String write(Model model) {
		resService.writeForm(model);
		return "/reserve/reserveWriteForm";
	}
	
	@RequestMapping(value = "reserveWrite", method = RequestMethod.POST)
	public String write(@Valid ReserveDto resDto, BindingResult result) {
		if (result.hasErrors())
			return "/reserve/reserveWriteForm";

		String page = resService.writeNsendEmail(resDto);
		return page;
	}
	
	@RequestMapping("reserveRead/{currentPage}-{resNum}")
	public String read(Model model, 
			@PathVariable("resNum") int resNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		resService.read(model, resNum, currentPage, update, keyField, keyWord);
		return "/reserve/reserveRead";
	}
	
	@RequestMapping(value = "reserveUpdate/{currentPage}-{resNum}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("resNum") int resNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		resService.read(model, resNum, currentPage, update, keyField, keyWord);
		return "/reserve/reserveUpdateForm";
	}
	
	@RequestMapping(value = "reserveUpdate/{currentPage}-{resNum}", method = RequestMethod.POST)
	public String update(Model model ,@Valid ReserveDto resDto, 
			@PathVariable("resNum") int resNum, 
			@PathVariable("currentPage") int currentPage,
			BindingResult result) {
		if (result.hasErrors())
			return "/reserve/reserveUpdateForm";
		
		resService.update(model, resDto);
		return "redirect:/reserveRead/" + currentPage  + "-" + resNum;
	}
	
	@RequestMapping(value = "reserveDelete/{currentPage}", method = RequestMethod.GET)
	public String delete(Model model, ReserveDto resDto, @PathVariable("currentPage") int currentPage) {
		resService.setCurrentPage(model, currentPage);
		return "/reserve/reserveDeleteForm";
	}
	
	@RequestMapping(value = "reserveDelete", method = RequestMethod.POST)
	public String delete(Model model, int resNum, int currentPage) {
		resService.delete(model, resNum);
		return "redirect:/reserveList/" + currentPage;
	}
	
}
