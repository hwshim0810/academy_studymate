package com.studymate.event.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		return "/event/eventMain";
	}
	
	@RequestMapping(value = "eventWrite", method = RequestMethod.GET)
	public String write(Model model) {
		eventService.writeForm(model);
		return "/event/eventWriteForm";
	}
	
	@RequestMapping(value = "eventWrite", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest request, @Valid EventDto eventDto,
			BindingResult result) throws Exception {
		if (result.hasErrors())
			return "/event/eventWriteForm";
		
		String page = eventService.write(request, eventDto);
		return page;
	}
	
	@RequestMapping("eventRead/{currentPage}-{boeNum}")
	public String read(Model model, 
			@PathVariable("boeNum") int boeNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		eventService.read(model, boeNum, currentPage, update, keyField, keyWord);
		return "/event/eventRead";
	}
	
	@RequestMapping(value = "eventUpdate/{currentPage}-{boeNum}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("boeNum") int boeNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		eventService.read(model, boeNum, currentPage, update, keyField, keyWord);
		return "/event/eventUpdateForm";
	}
	
	@RequestMapping(value = "eventUpdate", method = RequestMethod.POST)
	public String update(Model model , MultipartHttpServletRequest request,
			@Valid EventDto eventDto,BindingResult result, int currentPage ) {
		if (result.hasErrors())
			return "/event/eventUpdateForm/";
		
		String page = eventService.updateEvent(request, eventDto);
		return page;
	}
	
	@RequestMapping(value = "eventDelete/{currentPage}-{boeNum}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("boeNum") int boeNum, 
			@PathVariable("currentPage") int currentPage) {
		eventService.setCurrentPage(model, currentPage, boeNum);
		return "/event/eventDeleteForm";
	}
	
	@RequestMapping(value = "eventDelete", method = RequestMethod.POST)
	public String delete(Model model, EventDto eventDto, int currentPage) {
		eventService.delete(model, eventDto);
		return "redirect:/eventList/" + currentPage;
	}
	
	@RequestMapping(value= "joinEvent", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> joinEvent(String memId, int boeNum) {
		return eventService.joinEvent(memId, boeNum);
	}
	
}
