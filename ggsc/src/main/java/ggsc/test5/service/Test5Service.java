package ggsc.test5.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test5.service.Test5VO;

public interface Test5Service {
	
	// 목록
	List<EgovMap> getTest5List(Test5VO vo);

	// 개수
	int getTest5ListTotCnt(Test5VO vo);
	
	// 등록
	void insertTest5(Test5VO vo);
	
	
	void insertBand(Test5VO vo);
	
	// 상세
	EgovMap getTest5Detail(Test5VO vo);
	
	// 수정
	void updateTest5(Test5VO vo);
	
	//삭제
	void deleteTest5(Test5VO vo);
	
}