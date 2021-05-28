package ggsc.report.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class mindSharingVO extends PageVO {
	
	private int num;
	private String cnsGb, centerGb, cnsrId;
	private int bGubun;
	private String bDate, bSubject, bContent;
	private String fileName, sysFileName, filePath;
	private String userNum, voluntGb, gender, voluntNm, voluntAddr;
	private double fileSize;
	
	private String fDel, delYn;
	
	private MultipartFile file;
	
	private String schCenterGb, schCnsGb, schDateGb, schText;
	private String schStartDate;
    private String schEndDate;
	
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getVoluntNm() {
		return voluntNm;
	}
	public void setVoluntNm(String voluntNm) {
		this.voluntNm = voluntNm;
	}
	public String getVoluntAddr() {
		return voluntAddr;
	}
	public void setVoluntAddr(String voluntAddr) {
		this.voluntAddr = voluntAddr;
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
	public String getVoluntGb() {
		return voluntGb;
	}
	public void setVoluntGb(String voluntGb) {
		this.voluntGb = voluntGb;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchDateGb() {
		return schDateGb;
	}
	public void setSchDateGb(String schDateGb) {
		this.schDateGb = schDateGb;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}

	public String getSchText() {
		return schText;
	}
	public void setSchText(String schText) {
		this.schText = schText;
	}
	
	public String getfDel() {
		return fDel;
	}
	public void setfDel(String fDel) {
		this.fDel = fDel;
	}
	
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
	public int getbGubun() {
		return bGubun;
	}
	public void setbGubun(int bGubun) {
		this.bGubun = bGubun;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getbSubject() {
		return bSubject;
	}
	public void setbSubject(String bSubject) {
		this.bSubject = bSubject;
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
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "mindSharingVO [num=" + num + ", cnsGb=" + cnsGb + ", centerGb=" + centerGb + ", bGubun=" + bGubun
				+ ", bDate=" + bDate + ", bSubject=" + bSubject + ", bContent=" + bContent + ", fileName=" + fileName
				+ ", sysFileName=" + sysFileName + ", filePath=" + filePath + ", userNum=" + userNum + ", fileSize="
				+ fileSize + ", fDel=" + fDel + ", file=" + file + "]";
	}

}
