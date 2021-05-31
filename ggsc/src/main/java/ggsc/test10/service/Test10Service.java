package ggsc.test10.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test10.service.Test10VO;

public interface Test10Service {
	
	// 목록
	List<EgovMap> getTest10List(Test10VO vo);

	// 개수
	int getTest10ListTotCnt(Test10VO vo);
	
	// 등록
	void insertTest10(Test10VO vo);
	
	// 상세
	EgovMap getTest10Detail(Test10VO vo);
	
	// 수정
	void updateTest10(Test10VO vo);
	
	//삭제
	void deleteTest10(Test10VO vo);
	
}