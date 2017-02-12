package com.studymate.room.model;

import com.studymate.common.Dto;

public class RoomSubDto extends Dto {
	int borNum;
	String borSub, borSubpath;
	
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public String getBorSub() {
		return borSub;
	}
	public void setBorSub(String borSub) {
		this.borSub = borSub;
	}
	public String getBorSubpath() {
		return borSubpath;
	}
	public void setBorSubpath(String borSubpath) {
		this.borSubpath = borSubpath;
	}
	
}
