package egovframework.mobile.comfCns.service;

public interface MobileComfCnsService {
	
	// 상담신청 등록
	void insertComfCnsReg(ComfCnsVO vo) throws Exception;
	
	// 상담신청 등록(추가자료입력)
	void insertAddComfCnsReg(AddComfCnsVO vo);
}