package ggsc.test2.service;

import ams.cmm.PageVO;

public class Test2VO extends PageVO{
	
	private int num;
	private String title;
	private String writer;
	private String content;
	private String regId;
	private String fate;
	private String fate1;
	private String narcissusDt;
	private String narcissusSttHour;
	private String narcissusSttMin;
	private String narcissusEndHour;
	private String narcissusEndMin;
	private String g1Gb;
	private String homepage;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	
	public String getFate() {
		return fate;
	}
	public void setFate(String fate) {
		this.fate = fate;
	}
	
	@Override
	public String toString() {
		return "Test2VO [num=" + num + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regId="
				+ regId + ", fate=" + fate + "]";
	}
	public String getFate1() {
		return fate1;
	}
	public void setFate1(String fate1) {
		this.fate1 = fate1;
	}
	
	
	public String getNarcissusDt() {
		return narcissusDt;
	}
	public void setNarcissusDt(String narcissusDt) {
		this.narcissusDt = narcissusDt;
	}
	public String getNarcissusSttHour() {
		return narcissusSttHour;
	}
	public void setNarcissusSttHour(String narcissusSttHour) {
		this.narcissusSttHour = narcissusSttHour;
	}
	public String getNarcissusSttMin() {
		return narcissusSttMin;
	}
	public void setNarcissusSttMin(String narcissusSttMin) {
		this.narcissusSttMin = narcissusSttMin;
	}
	public String getNarcissusEndHour() {
		return narcissusEndHour;
	}
	public void setNarcissusEndHour(String narcissusEndHour) {
		this.narcissusEndHour = narcissusEndHour;
	}
	public String getNarcissusEndMin() {
		return narcissusEndMin;
	}
	public void setNarcissusEndMin(String narcissusEndMin) {
		this.narcissusEndMin = narcissusEndMin;
	}
	public String getG1Gb() {
		return g1Gb;
	}
	public void setG1Gb(String g1Gb) {
		this.g1Gb = g1Gb;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	
	
	
}