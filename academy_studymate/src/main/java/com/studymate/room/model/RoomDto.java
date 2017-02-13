package com.studymate.room.model;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class RoomDto extends Dto{
	private int borNum;
	@NotEmpty(message="지점명필수입력") @Size(min=4,message="최소 4자이상")
	private String borName;
	@NotEmpty(message="주소필수입력")
	private String borAddr;
	@NotEmpty(message="상세주소필수입력")
	private String borArea;
	private String borMain, borMainpath;
	@NotEmpty(message="한줄소개필수입력")
	private String borIntro;
	private String borMetro;
	private String borBus;
	Date borRegdate;
	
	
	public String getBorMetro() {
		return borMetro;
	}
	public void setBorMetro(String borMetro) {
		this.borMetro = borMetro;
	}
	public String getBorBus() {
		return borBus;
	}
	public void setBorBus(String borBus) {
		this.borBus = borBus;
	}
	public String getBorMain() {
		return borMain;
	}
	public void setBorMain(String borMain) {
		this.borMain = borMain;
	}
	public String getBorMainpath() {
		return borMainpath;
	}
	public void setBorMainpath(String borMainpath) {
		this.borMainpath = borMainpath;
	}
	public String getBorIntro() {
		return borIntro;
	}
	public void setBorIntro(String borIntro) {
		this.borIntro = borIntro;
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
	public Date getBorRegdate() {
		return borRegdate;
	}
	public void setBorRegdate(Date borRegdate) {
		this.borRegdate = borRegdate;
	}
	
	
}
