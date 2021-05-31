package ggsc.test1.service;

import ams.cmm.PageVO;

public class Test1VO extends PageVO{
	
	private int num;
	private String title;
	private String writer;
	private String content;
	private String regId;
	
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
	
	
	@Override
	public String toString() {
		return "Test1VO [num=" + num + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", regId=" + regId + "]";
	}
	
	
	
}