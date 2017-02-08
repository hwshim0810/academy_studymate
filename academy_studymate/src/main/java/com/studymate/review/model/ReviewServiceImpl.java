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
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(reviewDao, map);

		ReviewPaging reviewPaging = new ReviewPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", reviewPaging.getStartCount());
		map.put("endRow", reviewPaging.getEndCount());
		
		List<Dto> list = getList(reviewDao, map);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("reviewList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", reviewPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "reviewList/1");
		return model;
	}

	@Override
	public Model read(Model model, int borvNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			reviewDao.updateReadCount(borvNum);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("borvNum", borvNum);
		int blockCount = 5; 
		int blockPage = 5;
		int replyTotalCount = reviewDao.replyTotalCount(map);
		ReplyPaging replyPaging = new ReplyPaging(1, replyTotalCount, blockCount, blockPage);
		map.put("startRow", replyPaging.getStartCount());
		map.put("endRow", replyPaging.getEndCount());
		
		List<ReviewReplyDto> list = reviewDao.readReply(map);
		
		model.addAttribute("reviewDto", reviewDao.read(borvNum));
		model.addAttribute("reviewReply", list);
		model.addAttribute("replyPaging", replyPaging.getPagingHtml().toString());
		model.addAttribute("reviewPrev", reviewDao.readPrev(borvNum));
		model.addAttribute("reviewNext", reviewDao.readNext(borvNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/reviewList/1");
		model.addAttribute("updateBtn", "/reviewUpdate");
		model.addAttribute("deleteBtn", "/reviewDelete");
		model.addAttribute("primaryKey", borvNum);
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
	public Model delete(Model model, Dto reviewDto) {
		return model;
	}
	
	public String deleteHasReply(Model model, ReviewDto reviewDto, int currentPage) {
		int borvNum = ((ReviewDto) reviewDto).getBorvNum();
		int replyCount =  reviewDao.hasReply(borvNum);
		// 어떻게 모델처리하지??
		if (replyCount == 0) {
			reviewDao.delete(borvNum);
			return "redirect:/reviewList/" + currentPage;
		} else {
			model.addAttribute("borvNum", borvNum);
			model.addAttribute("currentPage", currentPage);
			return "/review/deleteError";
		}
	}
	
	public HashMap<String, Object> listReply(int replyPage, int borvNum) {
		HashMap<String, Object> map = new  HashMap<>();
		
		int blockCount = 5; 
		int blockPage = 5;
		map.put("borvNum", borvNum);
		int replyTotalCount = reviewDao.replyTotalCount(map);
		ReplyPaging replyPaging = new ReplyPaging(replyPage, replyTotalCount, blockCount, blockPage);
		map.put("startRow", replyPaging.getStartCount());
		map.put("endRow", replyPaging.getEndCount());
		
		return getReplyList(map, reviewDao, replyPaging.getPagingHtml().toString());
	}

	public HashMap<String, Object> writeReply(ReviewReplyDto replyDto, int replyPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		reviewDao.updateAddReplyCount(replyDto.getBorvNum());
		reviewDao.writeReply(replyDto);
		
		int blockCount = 5; 
		int blockPage = 5;
		map.put("borvNum", replyDto.getBorvNum());
		int replyTotalCount = reviewDao.replyTotalCount(map);
		ReplyPaging replyPaging = new ReplyPaging(replyPage, replyTotalCount, blockCount, blockPage);
		map.put("startRow", replyPaging.getStartCount());
		map.put("endRow", replyPaging.getEndCount());
		
		return getReplyList(map, reviewDao, replyPaging.getPagingHtml().toString());
	}

	public void deleteReply(int borvNum, int repNum) {
		reviewDao.updateDownReplyCount(borvNum);
		reviewDao.deleteReply(repNum);
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage, int borvNum) {
		model.addAttribute("borvNum", borvNum);
		model.addAttribute("currentPage", currentPage);
		return model;
	}
	
	@Override
	public Model writeForm(Model model) {
		model.addAttribute("reviewDto", new ReviewDto());
		return model;
	}

}
