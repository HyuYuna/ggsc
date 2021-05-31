package ggsc.test3.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test3.service.Test3VO;

public interface Test3Service {
	
	// 목록
	List<EgovMap> getTest3List(Test3VO vo);

	// 개수
	int getTest3ListTotCnt(Test3VO vo);
	
	// 등록
	void insertYunaUser(Test3VO vo);
	
	// 상세
	EgovMap getTest3Detail(String ysmId);
	
	// 수정
	void updateTest3(Test3VO vo);
	
	
	void updateYunaYn(Test3VO vo);
	
	//삭제
	void deleteTest3(Test3VO vo);
	
	
	void insertSecurity(Test3VO vo);
	
}