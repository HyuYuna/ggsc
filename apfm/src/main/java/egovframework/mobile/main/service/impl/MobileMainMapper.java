package egovframework.mobile.main.service.impl;

import egovframework.mobile.main.service.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mobileMainMapper")
public interface MobileMainMapper {
	
	// 로그인 정보
	EgovMap actionLogin(LoginVO vo) throws Exception;
	
	// 회원 ID 찾기
	EgovMap findUserId(LoginVO vo) throws Exception;
	
	// 회원 PW 찾기
	int findPw(LoginVO vo) throws Exception;
	
	// PW 재설정
	void userPwReset(LoginVO vo);
}
