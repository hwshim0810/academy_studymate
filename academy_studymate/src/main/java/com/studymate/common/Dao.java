package com.studymate.common;

import java.util.List;
import java.util.Map;

import com.studymate.qna.model.QnaDto;
import com.studymate.review.model.ReviewReplyDto;

public interface Dao {

	public int totalcount(Map<String, Object> map);
	
	public int hasReply(int num);

	public List<Dto> list(Map<String, Object> map);

	public Dto read(int num);
	
	public Dto readPrev(int num);
	
	public Dto readNext(int num);
	
	public List<ReviewReplyDto> readReply(Map<String, Object> map);

	public void write(Dto Dto);

	public void update(Dto Dto);

	public void delete(int num);
	
	public void deleteMem(String memId);
	
	public void updateReadCount(int num);
	
	public QnaDto isComment(int boqNum);

	public int hasComment(int boqGroupnum);

}
