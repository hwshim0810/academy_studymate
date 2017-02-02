package com.studymate.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.studymate.member.model.LoginDto;
import com.studymate.member.model.MemberDto;
import com.studymate.member.model.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "loginForm";
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
	
}
