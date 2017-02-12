package com.studymate.common.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.notice.model.NoticeDao;
import com.studymate.review.model.ReviewDao;
import com.studymate.room.model.RoomDao;

@Service
public class IndexServiceImpl extends CommonServiceUtil implements IndexService {
	@Autowired
	ReviewDao reviewDao;
	@Autowired
	NoticeDao noticeDao;
	@Autowired
	RoomDao roomDao;
	
	@Override
	public Model getIndexInfo(HttpSession session, Model model) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyWord", "");
		map.put("keyField", "");
		map.put("startRow", 1);
		map.put("endRow", 7);
		
		List<Dto> noticeList = getList(noticeDao, map);
		List<Dto> reviewList = getList(reviewDao, map);
		map.put("endRow", 5);
		List<Dto> roomList = getList(roomDao, map);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("roomList", roomList);
		session.setAttribute("page", "redirect:main");
		return model;
	}
}
