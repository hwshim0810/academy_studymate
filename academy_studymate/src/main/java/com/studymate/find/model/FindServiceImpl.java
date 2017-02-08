package com.studymate.find.model;

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
public class FindServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	FindDao findDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 5; 
		int blockPage = 5;
		int totalCount = getTotalCount(findDao, map);

		FindPaging findPaging = new FindPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", findPaging.getStartCount());
		map.put("endRow", findPaging.getEndCount());
		
		List<Dto> list = getList(findDao, map);

		model.addAttribute("findList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", findPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "findList");
		return model;
	}

	@Override
	public Model read(Model model, int bofNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("no"))
			findDao.updateReadCount(bofNum);

		model.addAttribute("qnaDto", findDao.read(bofNum));
		model.addAttribute("qnaPrev", findDao.readPrev(bofNum));
		model.addAttribute("qnaNext", findDao.readNext(bofNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return model;
	}

	@Override
	public void write(Dto findDto) {
		findDao.write(findDto);
	}

	@Override
	public Model update(Model model, Dto findDto) {
		findDao.update(findDto);
		return model;
	}

	@Override
	public Model delete(Model model, int bofNum) {
		findDao.delete(bofNum);
		return model;
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Model writeForm(Model model) {
		model.addAttribute("findDto", new FindDto());
		return model;
	}

}
