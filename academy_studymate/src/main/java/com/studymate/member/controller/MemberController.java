package com.studymate.member.controller;

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

import com.studymate.member.model.LoginDto;
import com.studymate.member.model.MemberDto;
import com.studymate.member.model.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session, @Valid LoginDto loginDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/loginForm";
		
		String page = memberService.login(session, loginDto);
		return page;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "memberJoin" , method = RequestMethod.GET)
	public String memberJoin() {
		return "redirect:/member/memberJoin";
	}
	
	@RequestMapping(value = "memberJoin" , method = RequestMethod.POST)
	public String memberJoin(@Valid MemberDto memDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/memberJoin";
		
		memberService.memberJoin(memDto);

		return "redirect:/member/joinSuccess";
	}
	
	@RequestMapping("isAbleId")
	public String isAbleId(String memId) {
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
	
	@RequestMapping(value = "memberDelete", method = RequestMethod.GET)
	public String updateDelMem(MemberDto memDto) {
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
	
	@RequestMapping(value = "memberRealDel/{currentPage}", method = RequestMethod.POST)
	public String deleteMem(String memId, @PathVariable("currentPage") int currentPage) {
		memberService.deleteMem(memId);
		return "redirect:/member/memberList/" + currentPage;
	}
}
