package com.studymate.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studymate.common.model.IndexService;

@Controller
public class IndexController {
	@Autowired
	IndexService indexService;
	
	@RequestMapping("siteInfo")
	public String siteInfo() {
		return "etc/siteInfo";
	}

	@RequestMapping("main")
	public String indexView(HttpSession session,Model model) {
		indexService.getIndexInfo(session, model);
		return "common/home";
	}
	
	@RequestMapping("faq")
	public String faq() {
		return "etc/faq";
	}
	
	@RequestMapping("needLogin")
	public String confirmLoginForm() {
		return "common/needLogin";
	}
	
	@RequestMapping("error")
	public String errorPage() {
		return "common/error/errorPage";
	}
}
