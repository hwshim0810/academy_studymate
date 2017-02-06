package com.studymate.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("siteInfo")
	public String siteInfo() {
		return "etc/siteInfo";
	}

	@RequestMapping("main")
	public String indexView() {
		return "home";
	}
	
	@RequestMapping("faq")
	public String faq() {
		return "etc/faq";
	}
}
