package ggsc.test7.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test6.service.Test6VO;

public interface Test7Service {
	
	// 목록
	List<EgovMap> getTest7List(Test6VO vo);
	
	// 목록
	List<EgovMap> getTest7G2List(Test6VO vo);
	
	// 목록
	List<EgovMap> getTest7G3List(Test6VO vo);
	
	// 목록
	List<EgovMap> getNoinGroupList(Test6VO vo);
	
	
	List<EgovMap> getAddRequestList(Test6VO vo);
	
	// 팝업
	List<EgovMap> findYunaPopup(yunaInfoVO vo);
	
	// 개수
	int getTest7ListTotCnt(Test6VO vo);
	
	
	int getNoinGroupTotCnt(Test6VO vo);
	
	
	int getAddRequestTotCnt(Test6VO vo);
	
	
	// 등록
	void insertTest7(Test6VO vo);
	
	
	void insertNoinClose(Test6VO vo);
	
	
	void insertNoinGroup(Test6VO vo);
	
	
	void insertNoinGroupReply(Test6VO vo);
	
	
	void insertAddInReq(Test7VO vo);
	
	
	void insertAddOutReq(Test7VO vo);
	
	// 상세
	EgovMap getTest7Detail(Test6VO vo);
	
	
	EgovMap getAddRequestDetail(Test7VO vo);
	
	
	// 수정
	void updateTest7(Test6VO vo);
	
	
	void updateNoinGroup(Test6VO vo);
	
	
	void updateNoinGroupReply(Test6VO vo);
	
	
	void updateAddInReq(Test7VO vo);
	
	
	void updateAddOutReq(Test7VO vo);
	
	//삭제
	void deleteTest7(Test6VO vo);
	
	
	void deleteNoinGroup(Test6VO vo);
	
	
	void deleteNoinGroupReply(Test6VO vo);
	
	
	int getTest7RegCheckAjax(int ysmNo);
	
	
	int getFindYunaTotCnt(yunaInfoVO vo);
	
	
	EgovMap getNoinGroupDtl(int num);
	
	
	EgovMap getNoinGroupReplyDtl(int num);
	
	
}