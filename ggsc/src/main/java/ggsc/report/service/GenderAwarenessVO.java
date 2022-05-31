package ggsc.report.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class GenderAwarenessVO extends PageVO {
	
	private int num;
	private String cnsGb, centerGb, cnsrId;
	private String bDate, bContent;
	private String fileName, sysFileName, filePath;
	private String userNum, voluntGb, instructor;
	private String appAgency;
	private String region;
	private String genderEduTitle;
	private String eduPerson;
	private double fileSize;
	
	private String fDel, delYn;
	
	private MultipartFile file;
	
	private String schCenterGb, schGenderEduGb, schDateGb, schType, schText;
	private String schStartDate;
    private String schEndDate;
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSysFileName() {
		return sysFileName;
	}
	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getVoluntGb() {
		return voluntGb;
	}
	public void setVoluntGb(String voluntGb) {
		this.voluntGb = voluntGb;
	}
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	public String getAppAgency() {
		return appAgency;
	}
	public void setAppAgency(String appAgency) {
		this.appAgency = appAgency;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getGenderEduTitle() {
		return genderEduTitle;
	}
	public void setGenderEduTitle(String genderEduTitle) {
		this.genderEduTitle = genderEduTitle;
	}
	public String getEduPerson() {
		return eduPerson;
	}
	public void setEduPerson(String eduPerson) {
		this.eduPerson = eduPerson;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public String getfDel() {
		return fDel;
	}
	public void setfDel(String fDel) {
		this.fDel = fDel;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchGenderEduGb() {
		return schGenderEduGb;
	}
	public void setSchGenderEduGb(String schGenderEduGb) {
		this.schGenderEduGb = schGenderEduGb;
	}
	public String getSchDateGb() {
		return schDateGb;
	}
	public void setSchDateGb(String schDateGb) {
		this.schDateGb = schDateGb;
	}
	public String getSchText() {
		return schText;
	}
	public void setSchText(String schText) {
		this.schText = schText;
	}
	public String getSchStartDate() {
		return schStartDate;
	}
	public void setSchStartDate(String schStartDate) {
		this.schStartDate = schStartDate;
	}
	public String getSchEndDate() {
		return schEndDate;
	}
	public void setSchEndDate(String schEndDate) {
		this.schEndDate = schEndDate;
	}
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
	}
	
	@Override
	public String toString() {
		return "GenderAwarenessVO [num=" + num + ", cnsGb=" + cnsGb + ", centerGb=" + centerGb + ", cnsrId=" + cnsrId
				+ ", bDate=" + bDate + ", bContent=" + bContent + ", fileName=" + fileName + ", sysFileName="
				+ sysFileName + ", filePath=" + filePath + ", userNum=" + userNum + ", voluntGb=" + voluntGb
				+ ", instructor=" + instructor + ", appAgency=" + appAgency + ", region=" + region + ", genderEduTitle="
				+ genderEduTitle + ", eduPerson=" + eduPerson + ", fileSize=" + fileSize + ", fDel=" + fDel + ", delYn="
				+ delYn + ", file=" + file + ", schCenterGb=" + schCenterGb + ", schGenderEduGb=" + schGenderEduGb
				+ ", schDateGb=" + schDateGb + ", schType=" + schType + ", schText=" + schText + ", schStartDate="
				+ schStartDate + ", schEndDate=" + schEndDate + "]";
	}
	
	
	
}