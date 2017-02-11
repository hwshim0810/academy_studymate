package com.studymate.room.controller;

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
		roomService.writeForm(model);
		return "/room/roomWriteForm";
	}
	
	@RequestMapping(value = "roomWrite", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest request, @Valid RoomDto roomDto,
			BindingResult result) throws Exception {
		if (result.hasErrors())
			return "/room/roomWriteForm";
		
		roomService.write(request, roomDto);
		return "redirect:/roomList/1";
	}
	
	@RequestMapping("roomRead/{currentPage}-{borNum}")
	public String read(Model model, 
			@PathVariable("borNum") int borNum, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String update,
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
	
	@RequestMapping(value = "roomDelete/{currentPage}-{borNum}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("borNum") int borNum, 
			@PathVariable("currentPage") int currentPage) {
		roomService.setCurrentPage(model, currentPage, borNum);
		return "/room/roomDeleteForm";
	}
	
	@RequestMapping(value = "roomDelete", method = RequestMethod.POST)
	public String delete(Model model, RoomDto roomDto, int currentPage) {
		roomService.delete(model, roomDto);
		return "redirect:/roomList/" + currentPage;
	}
	
	@RequestMapping("recommendRoom")
	public String recommend(int borvNum, String memId) {
		
		return "";
	}
	
	@RequestMapping(value = "getLocation", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> getLocation(String borAddr)  {
		return roomService.geoCoding(borAddr);
	}
	
}
