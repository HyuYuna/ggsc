package ggsc.test6.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Test6Service {
	
	// 목록
	List<EgovMap> getTest6List(Test6VO vo);

	// 개수
	int getTest6ListTotCnt(Test6VO vo);
	
	// 등록
	void insertTest6(Test6VO vo);
	
	// 상세
	EgovMap getTest6Detail(Test6VO vo);
	
	// 수정
	void updateTest6(Test6VO vo);
	
	//삭제
	void deleteTest6(Test6VO vo);
	
}