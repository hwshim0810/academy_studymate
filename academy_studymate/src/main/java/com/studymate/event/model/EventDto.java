package com.studymate.event.model;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class EventDto extends Dto {
	private int boeNum;
	@NotEmpty(message="제목필수입력") @Size(min=5,message="제목최소 5자이상")
	private String boeTitle;
	private String boeContent;
	private int boeReadcount;
	private int boeAble;
	private String boeDaterange;
	private String boeIsEnd;
	private String boeMain;
	private String boeMainpath;
	private Date boeRegdate;
	
	public String getBoeIsEnd() {
		return boeIsEnd;
	}
	public void setBoeIsEnd(String boeIsEnd) {
		this.boeIsEnd = boeIsEnd;
	}
	public int getBoeNum() {
		return boeNum;
	}
	public void setBoeNum(int boeNum) {
		this.boeNum = boeNum;
	}
	public String getBoeTitle() {
		return boeTitle;
	}
	public void setBoeTitle(String boeTitle) {
		this.boeTitle = boeTitle;
	}
	public String getBoeContent() {
		return boeContent;
	}
	public void setBoeContent(String boeContent) {
		this.boeContent = boeContent;
	}
	public int getBoeReadcount() {
		return boeReadcount;
	}
	public void setBoeReadcount(int boeReadcount) {
		this.boeReadcount = boeReadcount;
	}
	public int getBoeAble() {
		return boeAble;
	}
	public void setBoeAble(int boeAble) {
		this.boeAble = boeAble;
	}
	public String getBoeDaterange() {
		return boeDaterange;
	}
	public void setBoeDaterange(String boeDaterange) {
		this.boeDaterange = boeDaterange;
	}
	public String getBoeMain() {
		return boeMain;
	}
	public void setBoeMain(String boeMain) {
		this.boeMain = boeMain;
	}
	public String getBoeMainpath() {
		return boeMainpath;
	}
	public void setBoeMainpath(String boeMainpath) {
		this.boeMainpath = boeMainpath;
	}
	public Date getBoeRegdate() {
		return boeRegdate;
	}
	public void setBoeRegdate(Date boeRegdate) {
		this.boeRegdate = boeRegdate;
	}
	
}
