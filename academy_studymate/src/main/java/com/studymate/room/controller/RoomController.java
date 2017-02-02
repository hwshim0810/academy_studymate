package com.studymate.room.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.studymate.notice.model.NoticeDto;
import com.studymate.room.model.RoomDto;
import com.studymate.room.model.RoomServiceImpl;

@Controller
public class RoomController {
	@Autowired
	RoomServiceImpl roomService;
	
	@RequestMapping("roomList")
	public String list(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		roomService.list(session, model, currentPage, keyField, keyWord);
		return "/room/roomMain";
	}
	
	@RequestMapping(value = "roomWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("roomDto", new NoticeDto());
		return "/room/roomWriteForm";
	}
	
	@RequestMapping(value = "roomWrite", method = RequestMethod.POST)
	public String write(RoomDto roomDto, MultipartHttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int currentPage) {
		MultipartFile file = request.getFile("file");
		roomService.write(roomDto, file);
		return "redirect:/roomList?currentPage=" + currentPage;
	}
	
	@RequestMapping("roomRead")
	public String read(Model model, int bonNum, int currentPage, String update,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		roomService.read(model, bonNum, currentPage, update, keyField, keyWord);
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
		return "redirect:/roomRead?borNum=" + bonNum + "&currentPage=" + currentPage + "&update=yes";
	}
	
	@RequestMapping(value = "roomDelete", method = RequestMethod.GET)
	public String delete(RoomDto roomDto) {
		return "/notice/noticeDeleteForm";
	}
	
	@RequestMapping(value = "roomDelete", method = RequestMethod.POST)
	public String delete(Model model, int borNum, int currentPage) {
		roomService.delete(model, borNum);
		return "redirect:/roomList?currentPage=" + currentPage;
	}
	
	@RequestMapping("recommendRoom")
	public String recommend(int borvNum, String memId) {
		
		return "";
	}
}
