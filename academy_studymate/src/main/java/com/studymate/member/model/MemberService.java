package com.studymate.member.model;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService  {
	public static final String GUESTLEVEL = "member/notMem";
	public static final String WRONGPASS = "member/wrongPass";
	public static final String WRONGINFO = "member/wrongInfo";
	
	String login(HttpSession session, LoginDto loginDto);

	void logout(HttpSession session);

	void memberJoin(HttpSession session, MemberDto memDto);

	HashMap<String, Object> isAbleId(String memId);

	Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord);

	Model read(Model model, String memId, int currentPage, String keyField, String keyWord);

	Model update(Model model, MemberDto memDto);

	void updateDelMem(String memId);

	void deleteMem(String memId);
	
	Model setCurrentPage(Model model, int currentPage);
	
	Model writeForm(Model model);

	Model myPage(Model model, HttpSession session);

	Model updateClient(Model model, MemberDto memDto);

	HashMap<String, Object> isRightPass(String memId, String oldPass);

	Model findForm(Model model);

	String memberFindPass(FindDto findPassDto);

	String memberFindId(Model model, FindDto findDto);

	HashMap<String, Object> resPaging(int resPage, String memId);

	HashMap<String, Object> resDetail(int resNum);
}
