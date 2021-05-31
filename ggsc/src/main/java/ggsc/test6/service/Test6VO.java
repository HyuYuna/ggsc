package ggsc.test6.service;

import ams.cmm.PageVO;

public class Test6VO extends PageVO{
	
	private String num;
	private String title;
	private String content;
	private String regId;
	private String gender;
	private String example;
	private String weekCd;
	private String g1Gb;
	private String g2Gb;
	private String g3Gb;
	private String g4Gb;
	private String g5Gb;
	private String g6Gb;
	private String g7Gb;
	
	private String rfGb;
	private String advantage;
	private String weakness;

	private String ysmNm;
	private String ysmId;
	private String ysmNo;
	
	private String fate;
	private String narcissus;
	private String oasis;
	private String addr;
	
	private String schType;
	private String schtext;
	private String schYsmStartDt;
	private String schYsmEndDt;
	private String schContent;
	private String schAddReqGb;
	
	private String ysmDt;
	private String ysm2Dt;
	private String ysm3Dt;
	private String SttHour;
	private String SttMin;
	private String EndHour;
	private String EndMin;
	
	private String phone;
	private String tel;
	private String stft;
	private String sug;
	
	private String noinCnsr;
	private String noinDt;
	private String noinCntn;
	private String answerYn;
	private String rplyCnsr;
	private String rplyDt;
	private String rplyCntn;
	
	
	private String reqDept;
	private String reqDept2; // 외부연계의뢰서 연계기관명
	private String reqDeptPer;
	private String reqDt;
	private String helpDept;
	private String helpDeptPer;
	private String relyTerm;
	private String cnsleNm;
	private String cnsleNm2; // 외부연계의뢰서 내담자 상명
	private String birthDt;
	private String addr2; // 외부연계의뢰서 주소
	private String addrDtl;
	private String telNo;
	private String rcptSgct;
	private String reqResnCntn;
	private String pgrsRslt;
	private String offiNoteYn;
	private String addReqGb;
	private String etc;
	private String authCd;
	private String internalGb;
	private String outernalGb;
	
	private String linkReqName;
	private String linkReqNmTel;
	private String cnsleHelth;
	private String cnsleGongGb;
	private String cnslePsycRst;
	private int psycRstMmseds;
	private String psycRstEtc;
	private String cnsrOp;
	private String linkReqDesc;
	private String linkReqOrgNm;
	private String linkReqOrgTel;
	private String linkReqRecvName;
	private String linkReqRecvYear;
	private String linkReqRecvMonth;
	private String linkReqRecvDay;
	private String linkReqRecvRst;
	private String year;
	private String month;
	private String day;
	private String reqName;
	private String orgName;
	private String docSignPath;
	private String dbInsTm;
	private String age;

	// 상담내용 변수명
	private String cnsStat;
	private String cnsCnt;
	private String killRskn;
	private String cnsrNm;
	private String edu;
	private String cnsDt;
	
	// 유관기관관리 변수명
	private String relOrgNm;
	private String relOrgCd;
	
	
	
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getExample() {
		return example;
	}
	public void setExample(String example) {
		this.example = example;
	}
	public String getWeekCd() {
		return weekCd;
	}
	public void setWeekCd(String weekCd) {
		this.weekCd = weekCd;
	}
	public String getG1Gb() {
		return g1Gb;
	}
	public void setG1Gb(String g1Gb) {
		this.g1Gb = g1Gb;
	}
	public String getG2Gb() {
		return g2Gb;
	}
	public void setG2Gb(String g2Gb) {
		this.g2Gb = g2Gb;
	}
	public String getG3Gb() {
		return g3Gb;
	}
	public void setG3Gb(String g3Gb) {
		this.g3Gb = g3Gb;
	}
	public String getG4Gb() {
		return g4Gb;
	}
	public void setG4Gb(String g4Gb) {
		this.g4Gb = g4Gb;
	}
	public String getG5Gb() {
		return g5Gb;
	}
	public void setG5Gb(String g5Gb) {
		this.g5Gb = g5Gb;
	}
	public String getG6Gb() {
		return g6Gb;
	}
	public void setG6Gb(String g6Gb) {
		this.g6Gb = g6Gb;
	}
	
	public String getFate() {
		return fate;
	}
	public void setFate(String fate) {
		this.fate = fate;
	}
	public String getNarcissus() {
		return narcissus;
	}
	public void setNarcissus(String narcissus) {
		this.narcissus = narcissus;
	}
	public String getOasis() {
		return oasis;
	}
	public void setOasis(String oasis) {
		this.oasis = oasis;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
	}
	public String getSchtext() {
		return schtext;
	}
	public void setSchtext(String schtext) {
		this.schtext = schtext;
	}
	public String getSchYsmStartDt() {
		return schYsmStartDt;
	}
	public void setSchYsmStartDt(String schYsmStartDt) {
		this.schYsmStartDt = schYsmStartDt;
	}
	public String getSchYsmEndDt() {
		return schYsmEndDt;
	}
	public void setSchYsmEndDt(String schYsmEndDt) {
		this.schYsmEndDt = schYsmEndDt;
	}
	public String getSchContent() {
		return schContent;
	}
	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}
	public String getYsmDt() {
		return ysmDt;
	}
	public void setYsmDt(String ysmDt) {
		this.ysmDt = ysmDt;
	}
	public String getSttHour() {
		return SttHour;
	}
	public void setSttHour(String sttHour) {
		SttHour = sttHour;
	}
	public String getSttMin() {
		return SttMin;
	}
	public void setSttMin(String sttMin) {
		SttMin = sttMin;
	}
	public String getEndHour() {
		return EndHour;
	}
	public void setEndHour(String endHour) {
		EndHour = endHour;
	}
	public String getEndMin() {
		return EndMin;
	}
	public void setEndMin(String endMin) {
		EndMin = endMin;
	}
	public String getYsmNm() {
		return ysmNm;
	}
	public void setYsmNm(String ysmNm) {
		this.ysmNm = ysmNm;
	}
	public String getYsmId() {
		return ysmId;
	}
	public void setYsmId(String ysmId) {
		this.ysmId = ysmId;
	}
	public String getYsmNo() {
		return ysmNo;
	}
	public void setYsmNo(String ysmNo) {
		this.ysmNo = ysmNo;
	}
	public String getG7Gb() {
		return g7Gb;
	}
	public void setG7Gb(String g7Gb) {
		this.g7Gb = g7Gb;
	}
	public String getRfGb() {
		return rfGb;
	}
	public void setRfGb(String rfGb) {
		this.rfGb = rfGb;
	}
	
	public String getAdvantage() {
		return advantage;
	}
	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}
	public String getWeakness() {
		return weakness;
	}
	public void setWeakness(String weakness) {
		this.weakness = weakness;
	}
	public String getYsm2Dt() {
		return ysm2Dt;
	}
	public void setYsm2Dt(String ysm2Dt) {
		this.ysm2Dt = ysm2Dt;
	}
	public String getYsm3Dt() {
		return ysm3Dt;
	}
	public void setYsm3Dt(String ysm3Dt) {
		this.ysm3Dt = ysm3Dt;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getStft() {
		return stft;
	}
	public void setStft(String stft) {
		this.stft = stft;
	}
	public String getSug() {
		return sug;
	}
	public void setSug(String sug) {
		this.sug = sug;
	}
	public String getNoinCnsr() {
		return noinCnsr;
	}
	public void setNoinCnsr(String noinCnsr) {
		this.noinCnsr = noinCnsr;
	}
	public String getNoinDt() {
		return noinDt;
	}
	public void setNoinDt(String noinDt) {
		this.noinDt = noinDt;
	}
	public String getNoinCntn() {
		return noinCntn;
	}
	public void setNoinCntn(String noinCntn) {
		this.noinCntn = noinCntn;
	}
	public String getAnswerYn() {
		return answerYn;
	}
	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}
	public String getRplyCnsr() {
		return rplyCnsr;
	}
	public void setRplyCnsr(String rplyCnsr) {
		this.rplyCnsr = rplyCnsr;
	}
	public String getRplyDt() {
		return rplyDt;
	}
	public void setRplyDt(String rplyDt) {
		this.rplyDt = rplyDt;
	}
	public String getRplyCntn() {
		return rplyCntn;
	}
	public void setRplyCntn(String rplyCntn) {
		this.rplyCntn = rplyCntn;
	}
	public String getReqDept() {
		return reqDept;
	}
	public void setReqDept(String reqDept) {
		this.reqDept = reqDept;
	}
	public String getReqDept2() {
		return reqDept2;
	}
	public void setReqDept2(String reqDept2) {
		this.reqDept2 = reqDept2;
	}
	public String getReqDeptPer() {
		return reqDeptPer;
	}
	public void setReqDeptPer(String reqDeptPer) {
		this.reqDeptPer = reqDeptPer;
	}
	public String getReqDt() {
		return reqDt;
	}
	public void setReqDt(String reqDt) {
		this.reqDt = reqDt;
	}
	public String getHelpDept() {
		return helpDept;
	}
	public void setHelpDept(String helpDept) {
		this.helpDept = helpDept;
	}
	public String getHelpDeptPer() {
		return helpDeptPer;
	}
	public void setHelpDeptPer(String helpDeptPer) {
		this.helpDeptPer = helpDeptPer;
	}
	public String getRelyTerm() {
		return relyTerm;
	}
	public void setRelyTerm(String relyTerm) {
		this.relyTerm = relyTerm;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getCnsleNm2() {
		return cnsleNm2;
	}
	public void setCnsleNm2(String cnsleNm2) {
		this.cnsleNm2 = cnsleNm2;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public String getRcptSgct() {
		return rcptSgct;
	}
	public void setRcptSgct(String rcptSgct) {
		this.rcptSgct = rcptSgct;
	}
	public String getReqResnCntn() {
		return reqResnCntn;
	}
	public void setReqResnCntn(String reqResnCntn) {
		this.reqResnCntn = reqResnCntn;
	}
	public String getPgrsRslt() {
		return pgrsRslt;
	}
	public void setPgrsRslt(String pgrsRslt) {
		this.pgrsRslt = pgrsRslt;
	}
	public String getOffiNoteYn() {
		return offiNoteYn;
	}
	public void setOffiNoteYn(String offiNoteYn) {
		this.offiNoteYn = offiNoteYn;
	}
	public String getAddReqGb() {
		return addReqGb;
	}
	public void setAddReqGb(String addReqGb) {
		this.addReqGb = addReqGb;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getInternalGb() {
		return internalGb;
	}
	public void setInternalGb(String internalGb) {
		this.internalGb = internalGb;
	}
	public String getOuternalGb() {
		return outernalGb;
	}
	public void setOuternalGb(String outernalGb) {
		this.outernalGb = outernalGb;
	}
	public String getLinkReqName() {
		return linkReqName;
	}
	public void setLinkReqName(String linkReqName) {
		this.linkReqName = linkReqName;
	}
	public String getLinkReqNmTel() {
		return linkReqNmTel;
	}
	public void setLinkReqNmTel(String linkReqNmTel) {
		this.linkReqNmTel = linkReqNmTel;
	}
	public String getCnsleHelth() {
		return cnsleHelth;
	}
	public void setCnsleHelth(String cnsleHelth) {
		this.cnsleHelth = cnsleHelth;
	}
	public String getCnsleGongGb() {
		return cnsleGongGb;
	}
	public void setCnsleGongGb(String cnsleGongGb) {
		this.cnsleGongGb = cnsleGongGb;
	}
	public String getCnslePsycRst() {
		return cnslePsycRst;
	}
	public void setCnslePsycRst(String cnslePsycRst) {
		this.cnslePsycRst = cnslePsycRst;
	}
	public int getPsycRstMmseds() {
		return psycRstMmseds;
	}
	public void setPsycRstMmseds(int psycRstMmseds) {
		this.psycRstMmseds = psycRstMmseds;
	}
	public String getPsycRstEtc() {
		return psycRstEtc;
	}
	public void setPsycRstEtc(String psycRstEtc) {
		this.psycRstEtc = psycRstEtc;
	}
	public String getCnsrOp() {
		return cnsrOp;
	}
	public void setCnsrOp(String cnsrOp) {
		this.cnsrOp = cnsrOp;
	}
	public String getLinkReqDesc() {
		return linkReqDesc;
	}
	public void setLinkReqDesc(String linkReqDesc) {
		this.linkReqDesc = linkReqDesc;
	}
	public String getLinkReqOrgNm() {
		return linkReqOrgNm;
	}
	public void setLinkReqOrgNm(String linkReqOrgNm) {
		this.linkReqOrgNm = linkReqOrgNm;
	}
	public String getLinkReqOrgTel() {
		return linkReqOrgTel;
	}
	public void setLinkReqOrgTel(String linkReqOrgTel) {
		this.linkReqOrgTel = linkReqOrgTel;
	}
	public String getLinkReqRecvName() {
		return linkReqRecvName;
	}
	public void setLinkReqRecvName(String linkReqRecvName) {
		this.linkReqRecvName = linkReqRecvName;
	}
	public String getLinkReqRecvYear() {
		return linkReqRecvYear;
	}
	public void setLinkReqRecvYear(String linkReqRecvYear) {
		this.linkReqRecvYear = linkReqRecvYear;
	}
	public String getLinkReqRecvMonth() {
		return linkReqRecvMonth;
	}
	public void setLinkReqRecvMonth(String linkReqRecvMonth) {
		this.linkReqRecvMonth = linkReqRecvMonth;
	}
	public String getLinkReqRecvDay() {
		return linkReqRecvDay;
	}
	public void setLinkReqRecvDay(String linkReqRecvDay) {
		this.linkReqRecvDay = linkReqRecvDay;
	}
	public String getLinkReqRecvRst() {
		return linkReqRecvRst;
	}
	public void setLinkReqRecvRst(String linkReqRecvRst) {
		this.linkReqRecvRst = linkReqRecvRst;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getReqName() {
		return reqName;
	}
	public void setReqName(String reqName) {
		this.reqName = reqName;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getDocSignPath() {
		return docSignPath;
	}
	public void setDocSignPath(String docSignPath) {
		this.docSignPath = docSignPath;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getCnsStat() {
		return cnsStat;
	}
	public void setCnsStat(String cnsStat) {
		this.cnsStat = cnsStat;
	}
	public String getCnsCnt() {
		return cnsCnt;
	}
	public void setCnsCnt(String cnsCnt) {
		this.cnsCnt = cnsCnt;
	}
	public String getKillRskn() {
		return killRskn;
	}
	public void setKillRskn(String killRskn) {
		this.killRskn = killRskn;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getCnsDt() {
		return cnsDt;
	}
	public void setCnsDt(String cnsDt) {
		this.cnsDt = cnsDt;
	}
	public String getRelOrgNm() {
		return relOrgNm;
	}
	public void setRelOrgNm(String relOrgNm) {
		this.relOrgNm = relOrgNm;
	}
	public String getRelOrgCd() {
		return relOrgCd;
	}
	public void setRelOrgCd(String relOrgCd) {
		this.relOrgCd = relOrgCd;
	}
	public String getSchAddReqGb() {
		return schAddReqGb;
	}
	public void setSchAddReqGb(String schAddReqGb) {
		this.schAddReqGb = schAddReqGb;
	}
	
	
	
	
	
}
	
	
	
