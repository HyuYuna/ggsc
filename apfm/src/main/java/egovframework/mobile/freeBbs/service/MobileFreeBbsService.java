package egovframework.mobile.freeBbs.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MobileFreeBbsService {
	
	// 게시판 목록(알려드려요)
	List<EgovMap> getFreeBbsListA(BbsVO vo);
	
	// 게시판 목록 최신 5개(알려드려요)
	List<EgovMap> getFreeBbsListALimit(BbsVO vo);
	
	// 게시판 목록(자유게시판)
	List<EgovMap> getFreeBbsListB(BbsVO vo);
	
	// 게시판 상세보기(알려드려요)
	EgovMap getFreeBbsADtl(BbsVO vo);
	
	// 게시판 상세보기(자유게시판)
	EgovMap getFreeBbsBDtl(BbsVO vo);
	
	// 게시판 등록(자유게시판)
	void insertFreeBbsBReg(BbsVO vo) throws Exception;
}