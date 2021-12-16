package egovframework.mobile.cnsAsk.service.impl;

import java.util.List;

import egovframework.mobile.cnsAsk.service.CnsAskVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mobileCnsAskMapper")
public interface MobileCnsAskMapper {

	// 상담문의하기
	List<EgovMap> getCnsAskList(CnsAskVO vo);
	
	// 상담문의 등록
	void getCnsAskReg(CnsAskVO vo);
	
}
