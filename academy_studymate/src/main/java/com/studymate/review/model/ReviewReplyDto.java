package com.studymate.review.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class ReviewReplyDto extends Dto {
	private int repNum;
	private String repContent;
	private int borvNum;
	private Date repRegdate;
	private String memName, memId;
	
	public Date getRepRegdate() {
		return repRegdate;
	}
	public void setRepRegdate(Date repRegdate) {
		this.repRegdate = repRegdate;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public int getBorvNum() {
		return borvNum;
	}
	public void setBorvNum(int borvNum) {
		this.borvNum = borvNum;
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
