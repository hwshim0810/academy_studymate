package com.studymate.reserve.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studymate.reserve.model.ReserveDto;
import com.studymate.reserve.model.ReserveServiceImpl;

@Controller
public class ReserveController {
	@Autowired
	ReserveServiceImpl resService;
	
	@RequestMapping("reserveList")
	public String list(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		resService.list(session, model, currentPage, keyField, keyWord);
		return "/reserve/reserveMain";
	}
	
	@RequestMapping(value = "reserveWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("resDto", new ReserveDto());
		return "/reserve/reserveWriteForm";
	}
	
	@RequestMapping(value = "reserveWrite", method = RequestMethod.POST)
	public String write(@Valid ReserveDto resDto, BindingResult result) {
		if (result.hasErrors())
			return "/reserve/reserveWriteForm";

		resService.write(resDto);
		return "redirect:/reserveList";
	}
	
	@RequestMapping("reserveRead")
	public String read(Model model, int resNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		resService.read(model, resNum, currentPage, update, keyField, keyWord);
		return "/reserve/reserveRead";
	}
	
	@RequestMapping(value = "reserveUpdate", method = RequestMethod.GET)
	public String update(Model model, int resNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		resService.read(model, resNum, currentPage, update, keyField, keyWord);
		return "/reserve/reserveUpdateForm";
	}
	
	@RequestMapping(value = "reserveUpdate", method = RequestMethod.POST)
	public String update(Model model ,ReserveDto resDto, int resNum, int currentPage) {
		resService.update(model, resDto);
		return "redirect:/reserveRead?resNum=" + resNum + "&currentPage=" + currentPage + "&update=yes";
	}
	
	@RequestMapping(value = "reserveDelete", method = RequestMethod.GET)
	public String delete(ReserveDto resDto) {
		return "/reserve/reserveDeleteForm";
	}
	
	@RequestMapping(value = "reserveDelete", method = RequestMethod.POST)
	public String delete(Model model, int resNum, int currentPage) {
		resService.delete(model, resNum);
		return "redirect:/reserveList?currentPage=" + currentPage;
	}
	
}
