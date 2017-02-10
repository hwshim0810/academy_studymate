package com.studymate.qna.model;

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
public class QnaServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	QnaDao qnaDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(qnaDao, map);

		QnaPaging qnaPaging = new QnaPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", qnaPaging.getStartCount());
		map.put("endRow", qnaPaging.getEndCount());
		
		List<Dto> list = getList(qnaDao, map);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("qnaList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", qnaPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "redirect:qnaList/1");
		return model;
	}

	@Override
	public Model read(Model model, int boqNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			qnaDao.updateReadCount(boqNum);

		QnaDto qnaDto = (QnaDto) qnaDao.read(boqNum);
		model.addAttribute("qnaDto", qnaDto);
		model.addAttribute("qnaPrev", qnaDao.readPrev(boqNum));
		model.addAttribute("qnaNext", qnaDao.readNext(boqNum));
		model.addAttribute("qnaGroupnum", qnaDto.getBoqGroupnum());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/qnaList/1");
		model.addAttribute("updateBtn", "/qnaUpdate");
		model.addAttribute("deleteBtn", "/qnaDelete");
		model.addAttribute("commentBtn", "/qnaComment");
		model.addAttribute("primaryKey", boqNum);
	
		return model;
	}

	@Override
	public void write(Dto qnaDto) {
		int boqGroupnum = qnaDao.maxSequence();
		if (boqGroupnum != 1) boqGroupnum++;
		
		((QnaDto) qnaDto).setBoqGroupnum(boqGroupnum);
		
		qnaDao.write(qnaDto);
	}

	@Override
	public Model update(Model model, Dto qnaDto) {
		qnaDao.update(qnaDto);
		return model;
	}

	@Override // 답글때문에 사용안하는 Method
	public Model delete(Model model, Dto qnaDto) {
		qnaDao.delete(((QnaDto) qnaDto).getBoqNum());
		return model;
	}
	
	public String deleteQna(Model model, int boqGroupnum, int boqNum, int currentPage) {
		QnaDto qnaDto = qnaDao.isComment(boqNum);
		int commentCount = qnaDao.hasComment(boqGroupnum);
		
		if (qnaDto.getBoqSeq() > 0 || commentCount == 1) {
			qnaDao.delete(boqNum);
			return "redirect:/qnaList/" + currentPage;
		}
		else
			return "redirect:/qna/deleteError";
	}
	

	public void writeComment(QnaDto qnaDto) {
		int boqGroupnum = qnaDto.getBoqGroupnum();
		
		Map<String, Object> map = new HashMap<>();
		map.put("boqGroupnum", boqGroupnum);
		map.put("boqSeq", qnaDto.getBoqSeq());
		qnaDao.updateSeq(map);
		
		qnaDto.setBoqRefnum(qnaDto.getBoqNum());
		qnaDto.setBoqLev(qnaDto.getBoqLev()+1);
		qnaDto.setBoqSeq(qnaDto.getBoqSeq()+1);
		qnaDao.write(qnaDto);
	}
	
	@Override
	public Model setCurrentPage(Model model, int currentPage, int boqNum) {
		model.addAttribute("boqNum", boqNum);
		model.addAttribute("currentPage", currentPage);
		return model;
	}
	
	@Override
	public Model writeForm(Model model) {
		model.addAttribute("qnaDto", new QnaDto());
		return model;
	}

}
