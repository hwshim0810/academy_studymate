package com.studymate.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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

import com.studymate.member.model.FindDto;
import com.studymate.member.model.LoginDto;
import com.studymate.member.model.MemberDto;
import com.studymate.member.model.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
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
	public String memberJoin(HttpSession session, @Valid MemberDto memDto, BindingResult result, HttpServletRequest request) {
		if (result.hasErrors())
			return "/member/memberWrite";
		
		String page = memberService.memberJoin(session, memDto, request);

		return page;
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
	
	@RequestMapping("memberMypage")
	public String read(Model model, HttpSession session) {
		memberService.myPage(model, session);
		return "/member/memberMypage";
	}
	
	@RequestMapping("memberUpdateClient")
	public String updateClient(Model model, @Valid MemberDto memDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/memberMypage";
		
		memberService.updateClient(model, memDto);
		return "redirect:/memberMypage";
	}
	
	@RequestMapping(value = "isRightPass", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> isRightPass(String memId, String oldPass) {
		return memberService.isRightPass(memId, oldPass);
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
	
	@RequestMapping(value = "memberUpdate/{currentPage}", method = RequestMethod.POST)
	public String update(Model model ,MemberDto memDto, String memId, 
			@PathVariable("currentPage") int currentPage) {
		memberService.update(model, memDto);
		return "redirect:/memberAdRead/" + currentPage + "-" + memId;
	}
	
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public String updateDelMem(HttpSession session, String memId) {
		memberService.deleteMem(memId);
		memberService.logout(session);
		return "/member/memberOutMsg";
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
	
	@RequestMapping(value = "memberFind", method = RequestMethod.GET)
	public String memberFind(Model model) {
		memberService.findForm(model);
		return "/member/memberFindFormId";
	}
	
	@RequestMapping(value = "memberFindPass", method = RequestMethod.GET)
	public String memberFindPass(Model model) {
		memberService.findForm(model);
		return "/member/memberFindFormPass";
	}
	
	@RequestMapping("memberFindPass")
	public String memberFindPass(@Valid FindDto findDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/memberFindForm";
		
		return memberService.memberFindPass(findDto);
	}
	
	@RequestMapping("memberFindId")
	public String memberFindId(Model model, @Valid FindDto findDto, BindingResult result) {
		if (result.hasErrors())
			return "/member/memberFindForm";
		
		return memberService.memberFindId(model, findDto);
	}
	
	@RequestMapping(value = "memResPaging", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> resPaging(int resPage, String memId) {
		return memberService.resPaging(resPage, memId);
	}
	
	@RequestMapping(value = "memResDetail", produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> resDetail(int resNum) {
		return memberService.resDetail(resNum);
	}
}
