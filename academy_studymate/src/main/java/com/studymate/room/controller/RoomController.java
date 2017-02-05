package com.studymate.room.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.studymate.room.model.RoomDto;
import com.studymate.room.model.RoomServiceImpl;

@Controller
public class RoomController {
	@Autowired
	RoomServiceImpl roomService;
	
	@RequestMapping("roomList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		roomService.list(session, model, currentPage, keyField, keyWord);
		return "/room/roomMain";
	}
	
	@RequestMapping(value = "roomWrite", method = RequestMethod.GET)
	public String write(Model model) {
		return "/room/roomWriteForm";
	}
	
	@RequestMapping(value = "roomWrite", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest request, RoomDto roomDto) throws Exception {
		roomService.write(request, roomDto);
		return "redirect:/roomList/1";
	}
	
	@RequestMapping("roomRead/{currentPage}-{borNum}")
	public String read(Model model, 
			@PathVariable("borNum") int borNum, 
			@PathVariable("currentPage") int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		roomService.read(model, borNum, currentPage, update, keyField, keyWord);
		return "/room/roomRead";
	}
	
	@RequestMapping(value = "roomUpdate", method = RequestMethod.GET)
	public String update(Model model, int bonNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		roomService.read(model, bonNum, currentPage, update, keyField, keyWord);
		return "/room/roomUpdateForm";
	}
	
	@RequestMapping(value = "roomUpdate", method = RequestMethod.POST)
	public String update(Model model ,RoomDto roomDto, int bonNum, int currentPage) {
		roomService.update(model, roomDto);
		return "redirect:/roomRead/"+ currentPage + "-" + bonNum + "?update=y";
	}
	
	@RequestMapping(value = "roomDelete/{currentPage}", method = RequestMethod.GET)
	public String delete(Model model, RoomDto roomDto, @PathVariable("currentPage") int currentPage) {
		roomService.setCurrentPage(model, currentPage);
		return "/room/roomDeleteForm";
	}
	
	@RequestMapping(value = "roomDelete/{currentPage}", method = RequestMethod.POST)
	public String delete(Model model, int borNum, 
			@PathVariable("currentPage") int currentPage) {
		roomService.delete(model, borNum);
		return "redirect:/roomList/" + currentPage;
	}
	
	@RequestMapping("recommendRoom")
	public String recommend(int borvNum, String memId) {
		
		return "";
	}
}
