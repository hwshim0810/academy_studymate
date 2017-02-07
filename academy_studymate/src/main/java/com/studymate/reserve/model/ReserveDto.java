package com.studymate.reserve.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class ReserveDto extends Dto {
	int resNum;
	String resDate, resTime, borName;
	Date resRegdate;
	int borNum, resCount;
	String memId;
	
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	public String getBorName() {
		return borName;
	}
	public void setBorName(String borName) {
		this.borName = borName;
	}
	public Date getResRegdate() {
		return resRegdate;
	}
	public void setResRegdate(Date resRegdate) {
		this.resRegdate = resRegdate;
	}
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public int getResCount() {
		return resCount;
	}
	public void setResCount(int resCount) {
		this.resCount = resCount;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
}
