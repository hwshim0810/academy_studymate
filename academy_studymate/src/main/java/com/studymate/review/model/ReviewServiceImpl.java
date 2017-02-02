package com.studymate.review.model;

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
public class ReviewServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	ReviewDao reviewDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 5; 
		int blockPage = 5;
		int totalCount = getTotalCount(reviewDao, map);

		ReviewPaging qnaPaging = new ReviewPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", qnaPaging.getStartCount());
		map.put("endRow", qnaPaging.getEndCount());
		
		List<Dto> list = getList(reviewDao, map);

		model.addAttribute("reviewList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", qnaPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "reviewList");
		return model;
	}

	@Override
	public Model read(Model model, int borvNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("no"))
			reviewDao.updateReadCount(borvNum);

		model.addAttribute("reviewDto", reviewDao.read(borvNum));
		model.addAttribute("reviewReply", reviewDao.readReply(borvNum));
		model.addAttribute("reviewPrev", reviewDao.readPrev(borvNum));
		model.addAttribute("reviewNext", reviewDao.readNext(borvNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return model;
	}

	@Override
	public void write(Dto qnaDto) {
		reviewDao.write(qnaDto);
	}

	@Override
	public Model update(Model model, Dto qnaDto) {
		reviewDao.update(qnaDto);
		return model;
	}

	@Override // 댓글때문에 사용하지 않음
	public Model delete(Model model, int borvNum) {
		return model;
	}
	
	public String deleteHasReply(int borvNum, int currentPage) {
		int replyCount =  reviewDao.hasReply(borvNum);
		
		if (replyCount == 0) {
			reviewDao.delete(borvNum);
			return "redirect:/reviewList?currentPage=" + currentPage;
		} else
			return "/reserve/deleteError";
	}

	public void writeReply(ReviewReplyDto replyDto) {
		reviewDao.updateAddReplyCount(replyDto.getBorvNum());
		reviewDao.writeReply(replyDto);
	}

	public void deleteReply(int borvNum, int repNum) {
		reviewDao.updateDownReplyCount(borvNum);
		reviewDao.deleteReply(repNum);
	}

}
