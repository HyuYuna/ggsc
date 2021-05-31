package ggsc.test0.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test0.service.Test0VO;

public interface Test0Service {
	
	
	// 목록
	List<EgovMap> getTest0List(Test0VO vo);

	// 개수
	int getTest0ListTotCnt(Test0VO vo);
	
	
	int getClassTest(Test0VO vo);
	
	// 등록
	void insertYsmHcd(Test0VO vo);
	
	
	void insertYsmMcd(Test0VO vo);
	
	
	List<EgovMap> getTest0HList(Test0VO vo);
	
	
	List<EgovMap> getTest0MList(Test0VO vo);
	
	
	
}