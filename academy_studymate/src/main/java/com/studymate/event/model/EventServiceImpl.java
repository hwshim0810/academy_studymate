package com.studymate.event.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.common.ServiceInterface;
import com.studymate.notice.model.NoticeDto;
import com.studymate.notice.model.NoticePaging;

@Service
public class EventServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	EventDao eventDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(eventDao, map);
		
		NoticePaging noticePaging = new NoticePaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", noticePaging.getStartCount());
		map.put("endRow", noticePaging.getEndCount());
		
		List<Dto> list = getList(eventDao, map); 
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("eventList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", noticePaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "redirect:eventList/1");
		return model;
	}

	@Override
	public void write(Dto eventDto) {
		eventDao.write(eventDto);
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int boeNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			eventDao.updateReadCount(boeNum);
		
		model.addAttribute("eventDto", eventDao.read(boeNum));
		model.addAttribute("eventPrev", eventDao.readPrev(boeNum));
		model.addAttribute("eventNext", eventDao.readNext(boeNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/eventList/1");
		model.addAttribute("updateBtn", "/eventUpdate");
		model.addAttribute("deleteBtn", "/eventDelete");
		model.addAttribute("primaryKey", boeNum);
		return model;
	}

	@Override
	public Model update(Model model, Dto eventDto) {
		eventDao.update(eventDto);
		return model;
	}

	@Override
	public Model delete(Model model, Dto eventDto) {
		eventDao.delete(((NoticeDto) eventDto).getBonNum());
		return model;
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage, int boeNum) {
		model.addAttribute("bonNum", boeNum);
		model.addAttribute("currentPage", currentPage);
		return model;
	}
	
	@Override
	public Model writeForm(Model model) {
		model.addAttribute("eventDto", new EventDto());
		return model;
	}
}
