package com.studymate.reserve.controller;

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
	
	@RequestMapping(value ="reserveSeleted/{borNum}", method = RequestMethod.GET)
	public String write(Model model, @PathVariable("borNum") int borNum, 
			String borName) {
		resService.writeFormSelected(model, borName, borNum);
		return "/reserve/reserveWriteSelected";
	}
	
	@RequestMapping(value = "reserveWrite", method = RequestMethod.POST)
	public String write(HttpSession session, Model model, 
			@Valid ReserveDto resDto, BindingResult result, @RequestParam(required = false) String mailCheck) {
		if (result.hasErrors())
			return "/reserve/reserveWriteSelected";

		String page = resService.writeNsendEmail(session, model, resDto, mailCheck);
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
	
	@RequestMapping(value = "reserveDelete/{currentPage}-{resNum}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("resNum") int resNum, 
			@PathVariable("currentPage") int currentPage) {
		resService.setCurrentPage(model, currentPage, resNum);
		return "/reserve/reserveDeleteForm";
	}
	
	@RequestMapping(value = "reserveDelete", method = RequestMethod.POST)
	public String delete(Model model, ReserveDto resDto, int currentPage) {
		resService.delete(model, resDto);
		return "redirect:/reserveList/" + currentPage;
	}
	
	@RequestMapping(value = "getBorName", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> getBorName(int borNum) {
		 return resService.getBorName(borNum);
	}
	
}
