package com.studymate.find.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class FindStudyDto extends Dto {
	int bofNum;
	String bofTitle, bofLgsub, bofSmsub, bofIngdate, bofDay, bofIngtime; 
	int bofMemnum, bofCanmem;
	String bofContent;
	int bofReadcount;
	Date bofRegdate;
	String memName, memId;
	
	public int getBofNum() {
		return bofNum;
	}
	public void setBofNum(int bofNum) {
		this.bofNum = bofNum;
	}
	public String getBofTitle() {
		return bofTitle;
	}
	public void setBofTitle(String bofTitle) {
		this.bofTitle = bofTitle;
	}
	public String getBofLgsub() {
		return bofLgsub;
	}
	public void setBofLgsub(String bofLgsub) {
		this.bofLgsub = bofLgsub;
	}
	public String getBofSmsub() {
		return bofSmsub;
	}
	public void setBofSmsub(String bofSmsub) {
		this.bofSmsub = bofSmsub;
	}
	public String getBofIngdate() {
		return bofIngdate;
	}
	public void setBofIngdate(String bofIngdate) {
		this.bofIngdate = bofIngdate;
	}
	public String getBofDay() {
		return bofDay;
	}
	public void setBofDay(String bofDay) {
		this.bofDay = bofDay;
	}
	public String getBofIngtime() {
		return bofIngtime;
	}
	public void setBofIngtime(String bofIngtime) {
		this.bofIngtime = bofIngtime;
	}
	public int getBofMemnum() {
		return bofMemnum;
	}
	public void setBofMemnum(int bofMemnum) {
		this.bofMemnum = bofMemnum;
	}
	public int getBofCanmem() {
		return bofCanmem;
	}
	public void setBofCanmem(int bofCanmem) {
		this.bofCanmem = bofCanmem;
	}
	public String getBofContent() {
		return bofContent;
	}
	public void setBofContent(String bofContent) {
		this.bofContent = bofContent;
	}
	public int getBofReadcount() {
		return bofReadcount;
	}
	public void setBofReadcount(int bofReadcount) {
		this.bofReadcount = bofReadcount;
	}
	public Date getBofRegdate() {
		return bofRegdate;
	}
	public void setBofRegdate(Date bofRegdate) {
		this.bofRegdate = bofRegdate;
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
