package com.studymate.common;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ServiceInterface {
	Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord);

	Model read(Model model, int num, int currentPage, String update, String keyField, String keyWord);

	void write(Dto dto);

	Model update(Model model, Dto dto);

	Model delete(Model model, int num);
	
	Model setCurrentPage(Model model, int currentPage);
}
