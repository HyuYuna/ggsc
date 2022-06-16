package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class PrevPostVO extends PageVO{

	private int num;
	private int caseNo;
	private String cnsGb;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String prevPostGb;
	private String cnsleId;
	private String cnsleNm;
	private String cnsrId;
	private String cnsrNm;
	private String cnsrGb;
	private String authCd;
	
	private String regId;
	private String dbInsTm;

	
	private String cnsStat;
	private String cnsBefore;
	private String cnsAfter;
	private String inspectDt;
	private String prevState;
	private String postState;
	private String prevScore;
	private String postScore;
	
	private String inspectCnt;
	private String PrevCnt;
	private String PostCnt;
	private String prevMajorApplCd;
	private String postMajorApplCd;
	private String majorApplCd;
	private String prevSuggestion;
	private String postSuggestion;
	private String suggestion;
	
	private String schCnsGb;
	private String schCnsleNm;
	private String schCenterGb;
	private String schPrevPostGb;
	private String schStartDate;
	private String schEndDate;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
		this.caseNo = caseNo;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
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
	public String getPrevPostGb() {
		return prevPostGb;
	}
	public void setPrevPostGb(String prevPostGb) {
		this.prevPostGb = prevPostGb;
	}
	public String getCnsleId() {
		return cnsleId;
	}
	public void setCnsleId(String cnsleId) {
		this.cnsleId = cnsleId;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getCnsrGb() {
		return cnsrGb;
	}
	public void setCnsrGb(String cnsrGb) {
		this.cnsrGb = cnsrGb;
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
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getCnsStat() {
		return cnsStat;
	}
	public void setCnsStat(String cnsStat) {
		this.cnsStat = cnsStat;
	}
	public String getCnsBefore() {
		return cnsBefore;
	}
	public void setCnsBefore(String cnsBefore) {
		this.cnsBefore = cnsBefore;
	}
	public String getCnsAfter() {
		return cnsAfter;
	}
	public void setCnsAfter(String cnsAfter) {
		this.cnsAfter = cnsAfter;
	}
	public String getInspectDt() {
		return inspectDt;
	}
	public void setInspectDt(String inspectDt) {
		this.inspectDt = inspectDt;
	}
	public String getPrevState() {
		return prevState;
	}
	public void setPrevState(String prevState) {
		this.prevState = prevState;
	}
	public String getPostState() {
		return postState;
	}
	public void setPostState(String postState) {
		this.postState = postState;
	}
	public String getPrevScore() {
		return prevScore;
	}
	public void setPrevScore(String prevScore) {
		this.prevScore = prevScore;
	}
	public String getPostScore() {
		return postScore;
	}
	public void setPostScore(String postScore) {
		this.postScore = postScore;
	}
	public String getInspectCnt() {
		return inspectCnt;
	}
	public void setInspectCnt(String inspectCnt) {
		this.inspectCnt = inspectCnt;
	}
	public String getPrevCnt() {
		return PrevCnt;
	}
	public void setPrevCnt(String prevCnt) {
		PrevCnt = prevCnt;
	}
	public String getPostCnt() {
		return PostCnt;
	}
	public void setPostCnt(String postCnt) {
		PostCnt = postCnt;
	}
	public String getPrevMajorApplCd() {
		return prevMajorApplCd;
	}
	public void setPrevMajorApplCd(String prevMajorApplCd) {
		this.prevMajorApplCd = prevMajorApplCd;
	}
	public String getPostMajorApplCd() {
		return postMajorApplCd;
	}
	public void setPostMajorApplCd(String postMajorApplCd) {
		this.postMajorApplCd = postMajorApplCd;
	}
	public String getMajorApplCd() {
		return majorApplCd;
	}
	public void setMajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
	}
	public String getPrevSuggestion() {
		return prevSuggestion;
	}
	public void setPrevSuggestion(String prevSuggestion) {
		this.prevSuggestion = prevSuggestion;
	}
	public String getPostSuggestion() {
		return postSuggestion;
	}
	public void setPostSuggestion(String postSuggestion) {
		this.postSuggestion = postSuggestion;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchPrevPostGb() {
		return schPrevPostGb;
	}
	public void setSchPrevPostGb(String schPrevPostGb) {
		this.schPrevPostGb = schPrevPostGb;
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
	
	
}
