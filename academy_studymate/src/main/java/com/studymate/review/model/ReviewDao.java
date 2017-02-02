package com.studymate.review.model;

import java.util.List;

import com.studymate.common.Dao;

public interface ReviewDao extends Dao{
	public void deleteReply(int repNum);

	public void writeReply(ReviewReplyDto replyDto);

	public List<ReviewReplyDto> readReply(int borvNum);

	public void updateAddReplyCount(int borvNum);

	public void updateDownReplyCount(int borvNum);

}
