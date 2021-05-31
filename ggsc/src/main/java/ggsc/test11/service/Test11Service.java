package ggsc.test11.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Test11Service {
	
	// 목록
	List<EgovMap> getTest11List(Test11VO vo);

	// 개수
	int getTest11ListTotCnt(Test11VO vo);
	
	// 등록
	void insertTest11(Test11VO vo);
	
	// 상세
	EgovMap getTest11Detail(Test11VO vo);
	
	// 수정
	void updateTest11(Test11VO vo);
	
	//삭제
	void deleteTest11(Test11VO vo);
	
}