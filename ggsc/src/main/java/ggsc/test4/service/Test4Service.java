package ggsc.test4.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Test4Service {
	
	// 목록
	List<EgovMap> getTest4List(Test4VO vo);

	// 개수
	int getTest4ListTotCnt(Test4VO vo);
	
	// 등록
	void insertTest4(Test4VO vo);
	
	// 아이디 중복 확인
	int idCheck(String ysmId);
	
	// 유저등록
	void insertYsmUser(Test4VO vo);
	
	// 상세
	EgovMap getTest4Detail(String ysmNo);
	
	// 수정
	void updateTest4(Test4VO vo);
	
	
	void updateYsmYn(Test4VO vo);
	
	// 유저 수정
	void updateYsmUser(Test4VO vo);
	
	// 삭제
	void deleteTest4(Test4VO vo);
	
	// 유저 삭제
	void deleteYsmUser(Test4VO vo);
	
	// 신청 확인
	void updateConfirm(Test4VO vo);
	
	List<EgovMap> findYsmUser(Test4VO vo);
	
	public int getFindYsmUserTotCnt(Test4VO vo);
	
}