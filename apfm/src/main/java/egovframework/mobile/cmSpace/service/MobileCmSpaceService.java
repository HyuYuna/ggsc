package egovframework.mobile.cmSpace.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MobileCmSpaceService {
	
	// 센터소식 목록
	List<EgovMap> getCenterNewsList(BbsVO vo);
	
	// 게시판 목록 최신 5개(알려드려요)
	List<EgovMap> getCenterNewsListALimit(BbsVO vo);
	
	// 공지사항 목록
	List<EgovMap> getNoticeList(BbsVO vo);
	
	// 센터소식 상세
	EgovMap getCenterNewsDtl(BbsVO vo);
	
	// 센터소식 파일 상세
	List<EgovMap> getCenterNewsFileDtl(BbsVO vo);
		
	// 공지사항 상세
	EgovMap getNoticeDtl(BbsVO vo);
	
	// 공지사항 파일 상세
	List<EgovMap> getNoticeFileDtl(BbsVO vo);
	
	
	// 문서자료실 목록
	List<EgovMap> getCrLibraryList(BbsVO vo);
	
	// 문서자료실 상세
	EgovMap getCareLibraryDtl(BbsVO vo);
	
	// 문서자료실 파일 상세
	List<EgovMap> getCareLibraryFileDtl(BbsVO vo);
	
	
	// 자유게시판 목록
	List<EgovMap> getFreeBbsList(BbsVO vo);
	
	// 자유게시판 상세
	EgovMap getFreeBbsDtl(BbsVO vo);
	
	// 자유게시판 파일 상세
	List<EgovMap> getFreeBbsFileDtl(BbsVO vo);
	
	
	// 게시판 등록(자유게시판)
	void insertFreeBbsBReg(BbsVO vo) throws Exception;
}