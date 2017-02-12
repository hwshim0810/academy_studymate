package com.studymate.common.model;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IndexService {

	Model getIndexInfo(HttpSession session, Model model);

}
