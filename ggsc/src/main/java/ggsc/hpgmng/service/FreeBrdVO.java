package ggsc.hpgmng.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class FreeBrdVO extends PageVO{
	
	private int num;
	private int viewCount;
	private int authCd;
	private String title;
	private String writer;
	private String cntn;
	private String regId;
	private String dbInsTm;
	private String schFblStartDate;
	private String schFblEndDate;
	private String schFblType;
	private String schFblText;
	
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileSize;
	private MultipartFile file;
	
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getSchFblStartDate() {
		return schFblStartDate;
	}
	public void setSchFblStartDate(String schFblStartDate) {
		this.schFblStartDate = schFblStartDate;
	}
	public String getSchFblEndDate() {
		return schFblEndDate;
	}
	public void setSchFblEndDate(String schFblEndDate) {
		this.schFblEndDate = schFblEndDate;
	}
	public String getSchFblType() {
		return schFblType;
	}
	public void setSchFblType(String schFblType) {
		this.schFblType = schFblType;
	}
	public String getSchFblText() {
		return schFblText;
	}
	public void setSchFblText(String schFblText) {
		this.schFblText = schFblText;
	}
	
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
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getSysFileNm() {
		return sysFileNm;
	}
	public void setSysFileNm(String sysFileNm) {
		this.sysFileNm = sysFileNm;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	
}                                
