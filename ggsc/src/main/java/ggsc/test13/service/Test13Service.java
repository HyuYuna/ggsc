package ggsc.test13.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Test13Service {
	
	// 목록
	List<EgovMap> getTest13List(Test13VO vo);
	
	
	List<EgovMap> getAppleList(Test13VO vo);
	

	// 개수
	int getTest13ListTotCnt(Test13VO vo);
	
	
	int getAppleListTotCnt(Test13VO vo);
	
	
	// 등록
	void insertTest13(Test13VO vo);
	
	// 상세
	EgovMap getTest13Detail(Test13VO vo);
	
	// 수정
	void updateTest13(Test13VO vo);
	
	//삭제
	void deleteTest13(Test13VO vo);
	
}