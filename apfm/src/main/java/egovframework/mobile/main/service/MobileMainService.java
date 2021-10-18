package egovframework.mobile.main.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MobileMainService {

	// 로그인 정보
	EgovMap actionLogin(LoginVO vo) throws Exception;
	
	// 회원 ID 찾기
	EgovMap findUserId(LoginVO vo) throws Exception;
	
	// 회원 PW 찾기
	int findPw(LoginVO vo) throws Exception;
	
	// PW 재설정
	void userPwReset(LoginVO vo);
	
}
