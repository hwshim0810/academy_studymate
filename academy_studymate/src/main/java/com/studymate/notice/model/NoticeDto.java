package com.studymate.notice.model;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class NoticeDto extends Dto {
	int bonNum;
	@NotEmpty(message="제목필수입력") @Size(min=5,message="제목최소 5자이상")
	String bonTitle;
	@NotEmpty(message="내용필수입력") @Size(min=12,message="내용최소 5자이상")
	String bonContent;
	int bonReadcount;
	Date bonRegdate;
	
	public int getBonNum() {
		return bonNum;
	}
	public void setBonNum(int bonNum) {
		this.bonNum = bonNum;
	}
	public String getBonTitle() {
		return bonTitle;
	}
	public void setBonTitle(String bonTitle) {
		this.bonTitle = bonTitle;
	}
	public String getBonContent() {
		return bonContent;
	}
	public void setBonContent(String bonContent) {
		this.bonContent = bonContent;
	}
	public int getBonReadcount() {
		return bonReadcount;
	}
	public void setBonReadcount(int bonReadcount) {
		this.bonReadcount = bonReadcount;
	}
	public Date getBonRegdate() {
		return bonRegdate;
	}
	public void setBonRegdate(Date bonRegdate) {
		this.bonRegdate = bonRegdate;
	}
	
	
}
