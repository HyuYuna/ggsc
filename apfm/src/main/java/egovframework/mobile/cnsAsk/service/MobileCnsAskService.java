package egovframework.mobile.cnsAsk.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MobileCnsAskService {
	
	// 상담문의하기
	List<EgovMap> getCnsAskList(CnsAskVO vo);
	
	// 상담문의 등록
	void getCnsAskReg(CnsAskVO vo);
	
}