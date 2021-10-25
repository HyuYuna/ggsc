package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class CnsAcptVO extends PageVO {
	
	private String cnsGb;		// 상담구분코드 
	private String userId;		// 내담자 계정 ID 
	private String pw;			// 내담자 계정 비밀번호 
	private String userNm;		// 내담자 이름 
	private String gender;		// 성별 
	private String birthDt;		// 생년월일 
	private String email;		// 이메일 
	private String tel;			// 전화번호 
	private String mobile;		// 휴대전화 번호 
	private String addr;		// 주소 
	private String cnsHistYn;
	private String acptYn;		// 승인여부 
	private int caseNo;			// 내담자 고유값 
	private String regId;		// 등록자 아이디 , ( 상담사 ID )
	private String authCd;		// 권한 코드 
	private String sigunCd;		// 시군 코드 
	
	private String zoneGb;		// 권역구분 
	private String localGb;		// 지역구분 
	private String centerGb;	// 센터구분 
	
	private String majorApplCd; // 주요 문제 ( 주호소 증상 )
	private String schCnsGb;	// 쿼리 조회시 사용되는 , 상담구분  
	private String schCenterGb;	// 쿼리 조회시 사용되는 , 센터구분 
	private String schAcptNm;	// 쿼리 조회시 사용되는 내담자 명 
	private String schDt;		
	private String schStartDate;// between 조회절에 사용되는 시작일자  
	private String schEndDate;	// between 조회절에 사용되는 마지막 일자 
	
	
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
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
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getmajorApplCd() {
		return majorApplCd;
	}
	public void setmajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
		
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCnsHistYn() {
		return cnsHistYn;
	}
	public void setCnsHistYn(String cnsHistYn) {
		this.cnsHistYn = cnsHistYn;
	}
	public String getZoneGb() {
		return zoneGb;
	}
	public void setZoneGb(String zoneGb) {
		this.zoneGb = zoneGb;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchAcptNm() {
		return schAcptNm;
	}
	public void setSchAcptNm(String schAcptNm) {
		this.schAcptNm = schAcptNm;
	}
	public String getSchDt() {
		return schDt;
	}
	public void setSchDt(String schDt) {
		this.schDt = schDt;
	}
	
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
		this.caseNo = caseNo;
	}
	
	public String getAcptYn() {
		return acptYn;
	}
	
	public void setAcptYn(String acptYn) {
		this.acptYn = acptYn;
	}
	
	@Override
	public String toString() {
		return "CnsAcptVO [cnsGb=" + cnsGb + ", userId=" + userId + ", pw=" + pw + ", userNm=" + userNm + ", gender="
				+ gender + ", birthDt=" + birthDt + ", email=" + email + ", tel=" + tel + ", mobile=" + mobile
				+ ", addr=" + addr + ", cnsHistYn=" + cnsHistYn + ", acptYn=" + acptYn + ", caseNo=" + caseNo
				+ ", zoneGb=" + zoneGb + ", localGb=" + localGb + ", centerGb=" + centerGb + ", majorApplCd="
				+ majorApplCd + ", schCnsGb=" + schCnsGb + ", schCenterGb=" + schCenterGb + ", schAcptNm=" + schAcptNm
				+ ", schDt=" + schDt + "]";
	}
}
