package com.studymate.member.controller;

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

import com.studymate.member.model.LoginDto;
import com.studymate.member.model.MemberDto;
import com.studymate.member.model.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		memberService.writeForm(model);
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session, @Valid LoginDto loginDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/loginForm";

		String page = memberService.login(session, loginDto);
		return page;
	}
	
	@RequestMapping("logoutConfirm")
	public String logout() {
		return "/member/logoutForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "memberWrite" , method = RequestMethod.GET)
	public String memberJoin(Model model) {
		memberService.writeForm(model);
		return "/member/memberWrite";
	}
	
	@RequestMapping(value = "memberWrite" , method = RequestMethod.POST)
	public String memberJoin(@Valid MemberDto memDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/memberWrite";
		
		memberService.memberJoin(memDto);

		return "/member/joinSuccess";
	}
	
	@RequestMapping(value= "isAbleId", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> isAbleId(String memId) {
		return memberService.isAbleId(memId);
	}
	
	@RequestMapping("memberList/{currentPage}")
	public String list(HttpSession session, Model model, 
			@PathVariable("currentPage") int currentPage, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		memberService.list(session, model, currentPage, keyField, keyWord);
		return "/member/memberMain";
	}
	
	@RequestMapping("memberAdRead/{currentPage}-{memId}")
	public String adread(Model model, 
			@PathVariable("memId") String memId, 
			@PathVariable("currentPage") int currentPage,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		memberService.read(model, memId, currentPage, keyField, keyWord);
		return "/member/memberAdRead";
	}
	
	@RequestMapping("memberRead/{currentPage}-{memId}")
	public String read(Model model, 
			@PathVariable("memId") String memId, 
			@PathVariable("currentPage") int currentPage,
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		memberService.read(model, memId, currentPage, keyField, keyWord);
		return "/member/memberAdRead";
	}
	
	@RequestMapping(value = "memberUpdate/{currentPage}-{memId}", method = RequestMethod.GET)
	public String update(Model model, 
			@PathVariable("currentPage") int currentPage,
			@PathVariable("memId") String memId, 
			@RequestParam(required = false) String keyField, 
			@RequestParam(required = false) String keyWord) {
		memberService.read(model, memId, currentPage, keyField, keyWord);
		return "/member/memberUpdateForm";
	}
	
	@RequestMapping(value = "memberUpdate/{currentPage}-{memId}", method = RequestMethod.POST)
	public String update(Model model ,MemberDto memDto, 
			@PathVariable("memId") String memId, 
			@PathVariable("currentPage") int currentPage) {
		memberService.update(model, memDto);
		return "redirect:/memberRead/" + currentPage + "-" + memId;
	}
	
	@RequestMapping(value = "memberDelete/{currentPage}", method = RequestMethod.GET)
	public String updateDelMem(MemberDto memDto, @PathVariable("currentPage") int currentPage) {
		return "/member/memberDeleteForm";
	}
	
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public String updateDelMem(HttpSession session, String memId) {
		memberService.updateDelMem(memId);
		memberService.logout(session);
		return "redirect:/member/memberOutMsg";
	}
	
	@RequestMapping(value = "memberRealDel/{currentPage}", method = RequestMethod.GET)
	public String deleteMem(Model model, MemberDto memDto, @PathVariable("currentPage") int currentPage) {
		memberService.setCurrentPage(model, currentPage);
		return "/member/memberRealDelForm";
	}
	
	@RequestMapping(value = "memberRealDel", method = RequestMethod.POST)
	public String deleteMem(String memId, int currentPage) {
		memberService.deleteMem(memId);
		return "redirect:/memberList/" + currentPage;
	}
}
