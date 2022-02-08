package ggsc.hpgmng.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomepageMngService {
	
	// 공지사항 목록
	List<EgovMap> getNoticeList(NoticeVO vo);
	
	// 공지사항 갯수
	int getNoticeListTotCnt(NoticeVO vo);
	
	// 공지사항 등록
	void insertNotice(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 공지사항 수정
	void updateNotice(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 공지사항 삭제
	void deleteNotice(int noticeNum);
	
	// 공지사항 상세
	EgovMap getNoticeDtl(int num);
	
	// 공지사항 상세 파일 목록
	List<EgovMap> getNoticeFileDtl(int num);
	
	
	// 자유게시판 목록
	List<EgovMap> getFreeBoardList(FreeBrdVO vo);
		
	// 자유게시판 갯수
	int getFreeBoardListTotCnt(FreeBrdVO vo);
	
	// 자유게시판 등록
	void insertFreeBoard(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 자유게시판 수정
	void updateFreeBoard(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 자유게시판 삭제
	void deleteFreeBoard(int freeBrdNum);
	
	// 자유게시판 상세
	EgovMap getFreeBoardDtl(int num);
	
	// 자유게시판 상세 파일 목록
	List<EgovMap> getFreeBoardFileDtl(int num);
	
	
	
	// 문서자료실 목록
	List<EgovMap> getLibraryList(LibraryVO vo);
	
	// 문서자료실 갯수
	int getLibraryListTotCnt(LibraryVO vo);
	
	// 문서자료실 등록
	void insertLibrary(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 문서자료실 수정
	void updateLibrary(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 문서자료실 삭제
	void deleteLibrary(int noticeNum);
	
	// 문서자료실 상세
	EgovMap getLibraryDtl(int num);
	
	// 문서자료실 상세 파일 목록
	List<EgovMap> getLibraryFileDtl(int num);
	
	
	
	// 센터소식 목록
	List<EgovMap> getCenterNewsList(NewsVO vo);
	
	// 센터소식 갯수
	int getCenterNewsListTotCnt(NewsVO vo);
	
	// 센터소식 등록
	void insertCenterNews(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 센터소식 수정
	void updateCenterNews(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception ;
	
	// 센터소식 삭제
	void deleteCenterNews(int noticeNum);
	
	// 센터소식 상세
	EgovMap getCenterNewsDtl(int num);
	
	// 센터소식 상세 파일 목록
	List<EgovMap> getCenterNewsFileDtl(int num);
	
	
	// 온라인상담 목록
	List<EgovMap> getOnlineAskList(OnlineAskVO vo);
	
	// 온라인상담 갯수
	int getOnlineAskListTotCnt(OnlineAskVO vo);
	
	// 온라인상담 등록
	void insertOnlineAsk(OnlineAskVO vo);
	
	// 온라인상담 수정
	void updateOnlineAsk(OnlineAskVO vo);
	
	// 온라인상담 수정
	void deleteOnlineAsk(int onlineNum);
	
	// 온라인상담 상세
	EgovMap getOnlineAskDtl(int num);
	
	// 교육신청 목록
	List<EgovMap> getEduAppList(EduAppVO vo);
	
	// 교육신청 갯수
	int getEduAppListTotCnt(EduAppVO vo);
	
	// 교육신청 상세
	EgovMap getEduAppDtl(int num);
	
	// 교육신청 수정
	void updateEduApp(EduAppVO vo);
	
	// 팝업 목록
	List<EgovMap> getPopupList(PopupVO vo);
	
	// 팝업 갯수
	int getPopupListTotCnt(PopupVO vo);
	
	// 팝업 상세
	EgovMap getPopupDtl(int num);
	
	// 팝업 등록
	void insertPopup(PopupVO vo);
	
	// 팝업 수정
	void updatePopup(PopupVO vo);
	
	// 팝업 삭제
	void deletePopup(PopupVO vo);
	
//	// FAQ 목록
//	List<EgovMap> getFaqList(FaqVO vo);
//	
//	// FAQ 갯수
//	int getFaqListTotCnt(FaqVO vo);
//	
//	// FAQ 등록
//	void insertFaq(FaqVO vo);
//	
//	// FAQ 상세
//	EgovMap getFaqDetail(int num);
//	
//	// FAQ 수정
//	void updateFaq(FaqVO vo);
//	

}
