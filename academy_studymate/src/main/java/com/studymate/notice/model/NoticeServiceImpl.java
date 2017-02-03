package com.studymate.notice.model;

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

@Service
public class NoticeServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 5; 
		int blockPage = 5;
		int totalCount = getTotalCount(noticeDao, map);
		
		NoticePaging noticePaging = new NoticePaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", noticePaging.getStartCount());
		map.put("endRow", noticePaging.getEndCount());
		
		List<Dto> list = getList(noticeDao, map); 
		
		model.addAttribute("noticeList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", noticePaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "noticelist/1");
		return model;
	}

	@Override
	public void write(Dto noticeDto) {
		noticeDao.write(noticeDto);
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int bonNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			noticeDao.updateReadCount(bonNum);
		
		model.addAttribute("noticeDto", noticeDao.read(bonNum));
		model.addAttribute("noticePrev", noticeDao.readPrev(bonNum));
		model.addAttribute("noticeNext", noticeDao.readNext(bonNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return model;
	}

	@Override
	public Model update(Model model, Dto noticeDto) {
		noticeDao.update(noticeDto);
		return model;
	}

	@Override
	public Model delete(Model model, int bonNum) {
		noticeDao.delete(bonNum);
		return model;
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage) {
		model.addAttribute("currentPage", currentPage);
		return model;
	}

}
