package com.studymate.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("siteInfo")
	public String siteInfo() {
		return "etc/siteInfo";
	}

	@RequestMapping("main")
	public String indexView(HttpSession session) {
		session.setAttribute("page", "redirect:main");
		return "common/home";
	}
	
	@RequestMapping("faq")
	public String faq() {
		return "etc/faq";
	}
}
