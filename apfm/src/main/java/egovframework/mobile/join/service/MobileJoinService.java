package egovframework.mobile.join.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MobileJoinService {
	
	// 회원가입 등록
	void insertJoinReg(JoinVO vo);
	
	// 아이디 중복확인
	int getIdCheck(String userId);
	
	// 공통값 목록
	List<EgovMap> getGroupMngDtlMList(CommonVO param);
	
	// 센터 목록
	List<EgovMap> getCenterManageList(CenterVO centerVO);
	
}