package com.studymate.review.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class ReviewDto extends Dto {
	int borvNum;
	String borvTitle, borvContent;
	int borvReplycount, borvReadcount;
	Date borvRegdate;
	String memName, memId;
	
	public int getBorvNum() {
		return borvNum;
	}
	public void setBorvNum(int borvNum) {
		this.borvNum = borvNum;
	}
	public String getBorvTitle() {
		return borvTitle;
	}
	public void setBorvTitle(String borvTitle) {
		this.borvTitle = borvTitle;
	}
	public String getBorvContent() {
		return borvContent;
	}
	public void setBorvContent(String borvContent) {
		this.borvContent = borvContent;
	}
	public int getBorvReplycount() {
		return borvReplycount;
	}
	public void setBorvReplycount(int borvReplycount) {
		this.borvReplycount = borvReplycount;
	}
	public int getBorvReadcount() {
		return borvReadcount;
	}
	public void setBorvReadcount(int borvReadcount) {
		this.borvReadcount = borvReadcount;
	}
	public Date getBorvRegdate() {
		return borvRegdate;
	}
	public void setBorvRegdate(Date borvRegdate) {
		this.borvRegdate = borvRegdate;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}

}
