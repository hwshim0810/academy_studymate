package com.studymate.qna.model;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class QnaDto extends Dto {
	private int boqNum ;
	@NotEmpty(message="제목필수입력") @Size(min=5,message="제목최소 5자이상")
	private String boqTitle;
	@NotEmpty(message="내용필수입력") @Size(min=12,message="내용최소 5자이상")
	private String boqContent;
	private int boqGroupnum, boqSeq,  boqLev;
	private Date boqRegdate; 
	private int boqReadcount;
	private String memName;
	private String memId;
	private Integer boqRefnum;
	
	public Integer getBoqRefnum() {
		return boqRefnum;
	}
	public void setBoqRefnum(Integer boqRefnum) {
		this.boqRefnum = boqRefnum;
	}
	public int getBoqNum() {
		return boqNum;
	}
	public void setBoqNum(int boqNum) {
		this.boqNum = boqNum;
	}
	public String getBoqTitle() {
		return boqTitle;
	}
	public void setBoqTitle(String boqTitle) {
		this.boqTitle = boqTitle;
	}
	public String getBoqContent() {
		return boqContent;
	}
	public void setBoqContent(String boqContent) {
		this.boqContent = boqContent;
	}
	public int getBoqGroupnum() {
		return boqGroupnum;
	}
	public void setBoqGroupnum(int boqGroupnum) {
		this.boqGroupnum = boqGroupnum;
	}
	public int getBoqSeq() {
		return boqSeq;
	}
	public void setBoqSeq(int boqSeq) {
		this.boqSeq = boqSeq;
	}
	public int getBoqLev() {
		return boqLev;
	}
	public void setBoqLev(int boqLev) {
		this.boqLev = boqLev;
	}
	public Date getBoqRegdate() {
		return boqRegdate;
	}
	public void setBoqRegdate(Date boqRegdate) {
		this.boqRegdate = boqRegdate;
	}
	public int getBoqReadcount() {
		return boqReadcount;
	}
	public void setBoqReadcount(int boqReadcount) {
		this.boqReadcount = boqReadcount;
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
