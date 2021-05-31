package ggsc.test12.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Test12Service {
	
	// 목록
	List<EgovMap> getTest12List(Test12VO vo);

	// 개수
	int getTest12ListTotCnt(Test12VO vo);
	
	// 등록
	void insertTest12(Test12VO vo);
	
	// 상세
	EgovMap getTest12Detail(Test12VO vo);
	
	// 수정
	void updateTest12(Test12VO vo);
	
	//삭제
	void deleteTest12(Test12VO vo);
	
}