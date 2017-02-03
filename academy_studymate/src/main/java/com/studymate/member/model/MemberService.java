package com.studymate.member.model;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService {
	public static final String GUESTLEVEL = "notMem";
	public static final String WRONGPASS = "wrongPass";
	
	String login(HttpSession session, LoginDto loginDto);

	void logout(HttpSession session);

	void memberJoin(MemberDto memDto);

	String isAbleId(String memId);

	Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord);

	Model read(Model model, String memId, int currentPage, String keyField, String keyWord);

	Model update(Model model, MemberDto memDto);

}
