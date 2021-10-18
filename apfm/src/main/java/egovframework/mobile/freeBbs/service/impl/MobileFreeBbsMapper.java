package egovframework.mobile.freeBbs.service.impl;

import java.util.List;

import egovframework.mobile.freeBbs.service.BbsVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mobileFreeBbsMapper")
public interface MobileFreeBbsMapper {
	
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
	
	// 게시판 등록(알려드려요)
	void insertFreeBbsAReg(BbsVO vo);
	
	// 게시판 파일업로드(알려드려요)
	void insertFreeBbsAFileUpload(BbsVO vo);
	
	// 게시판 등록(자유게시판)
	void insertFreeBbsBReg(BbsVO vo);
	
	// 게시판 파일업로드(자유게시판)
	void insertFreeBbsBFileUpload(BbsVO vo);
	
}
