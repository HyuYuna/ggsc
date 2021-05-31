package ggsc.test1.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test1.service.Test1VO;

public interface Test1Service {
	
	// 목록(select)
	List<EgovMap> getTest1SelectList(Test1VO vo);
	
	// 목록
	List<EgovMap> getTest1List(Test1VO vo);

	// 개수
	int getTest1ListTotCnt(Test1VO vo);
	
	// 등록
	void insertTest1(Test1VO vo);
	
	// 상세
	EgovMap getTest1Detail(int num);
	
	// 수정
	void updateTest1(Test1VO vo);
	
	//삭제
	void deleteTest1(Test1VO vo);
	
}