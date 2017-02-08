package com.studymate.room.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class RoomDto extends Dto{
	int borNum;
	String borName, borAddr, borArea, borFilename, borNewFilename;
	int borReadcount;
	Date borRegdate;
	
	public String getBorNewFilename() {
		return borNewFilename;
	}
	public void setBorNewFilename(String borNewFilename) {
		this.borNewFilename = borNewFilename;
	}
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public String getBorName() {
		return borName;
	}
	public void setBorName(String borName) {
		this.borName = borName;
	}
	public String getBorAddr() {
		return borAddr;
	}
	public void setBorAddr(String borAddr) {
		this.borAddr = borAddr;
	}
	public String getBorArea() {
		return borArea;
	}
	public void setBorArea(String borArea) {
		this.borArea = borArea;
	}
	public String getBorFilename() {
		return borFilename;
	}
	public void setBorFilename(String borFilename) {
		this.borFilename = borFilename;
	}
	public int getBorReadcount() {
		return borReadcount;
	}
	public void setBorReadcount(int borReadcount) {
		this.borReadcount = borReadcount;
	}
	public Date getBorRegdate() {
		return borRegdate;
	}
	public void setBorRegdate(Date borRegdate) {
		this.borRegdate = borRegdate;
	}
	
	
}
