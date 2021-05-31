package ggsc.test2.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test2.service.Test2VO;

public interface Test2Service {
	
	// 목록(select)
	List<EgovMap> getTest2SelectList(Test2VO vo);
	
	// 목록
	List<EgovMap> getTest2List(Test2VO vo);

	// 개수
	int getTest2ListTotCnt(Test2VO vo);
	
	// 등록
	void insertTest2(Test2VO vo);
	
	// 상세
	EgovMap getTest2Detail(int num);
	
	// 수정
	void updateTest2(Test2VO vo);
	
	//삭제
	void deleteTest2(Test2VO vo);
	
	public int narcissusCheck(String title);
	
}