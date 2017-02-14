package com.studymate.event.controller;

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

import com.studymate.event.model.EventDto;
import com.studymate.event.model.EventServiceImpl;

@Controller
public class EventController {
	@Autowired
	EventServiceImpl eventService;
	
	@RequestMapping("eventList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		eventService.list(session, model, currentPage, keyField, keyWord);
		return "/notice/noticeMain";
	}
	
	@RequestMapping(value = "eventWrite", method = RequestMethod.GET)
	public String write(Model model) {
		eventService.writeForm(model);
		return "/notice/noticeWriteForm";
	}
	
	@RequestMapping(value = "eventWrite", method = RequestMethod.POST)
	public String write(@Valid EventDto eventDto, BindingResult result) {
		if (result.hasErrors())
			return "/event/eventWriteForm";

		eventService.write(eventDto);
		return "redirect:/eventList/1";
	}
	
	@RequestMapping("eventRead/{currentPage}-{boeNum}")
	public String read(Model model, 
			@PathVariable("boeNum") int boeNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		eventService.read(model, boeNum, currentPage, update, keyField, keyWord);
		return "/event/eventRead";
	}
	
	@RequestMapping(value = "eventUpdate/{currentPage}-{boeNum}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("boeNum") int boeNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		eventService.read(model, boeNum, currentPage, update, keyField, keyWord);
		return "/notice/noticeUpdateForm";
	}
	
	@RequestMapping(value = "eventUpdate/{currentPage}", method = RequestMethod.POST)
	public String update(Model model ,@Valid EventDto eventDto, BindingResult result, int boeNum, 
			@PathVariable("currentPage") int currentPage) {
		if (result.hasErrors())
			return "/event/eventUpdateForm";
		
		eventService.update(model, eventDto);
		return "redirect:/eventRead/" + currentPage + "-" + boeNum + "?update=y";
	}
	
	@RequestMapping(value = "eventDelete/{currentPage}-{boeNum}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("boeNum") int boeNum, 
			@PathVariable("currentPage") int currentPage) {
		eventService.setCurrentPage(model, currentPage, boeNum);
		return "/event/eventDeleteForm";
	}
	
	@RequestMapping(value = "eventDelete", method = RequestMethod.POST)
	public String delete(Model model,  EventDto eventDto, int currentPage) {
		eventService.delete(model, eventDto);
		return "redirect:/noticeList/" + currentPage;
	}
	
}
