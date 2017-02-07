package com.studymate.review.model;

import java.util.Map;

import com.studymate.common.Dao;

public interface ReviewDao extends Dao{
	public void deleteReply(int repNum);

	public void writeReply(ReviewReplyDto replyDto);

	public void updateAddReplyCount(int borvNum);

	public void updateDownReplyCount(int borvNum);

	public int replyTotalCount(Map<String, Object> map);

}
