package ggsc.hpgmng.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.hpgmng.service.EduAppVO;
import ggsc.hpgmng.service.FreeBrdVO;
import ggsc.hpgmng.service.LibraryVO;
import ggsc.hpgmng.service.NewsVO;
import ggsc.hpgmng.service.OnlineAskVO;
import ggsc.hpgmng.service.PopupVO;
import ggsc.hpgmng.service.NoticeVO;

@Repository("hpgmngDao")
public class HomepageMngDAO extends EgovAbstractDAO {

	// 공지사항 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getNoticeList(NoticeVO vo){
		return (List<EgovMap>)list("hpgmngDao.getNoticeList", vo);
	}
	
	// 공지사항 갯수
	public int getNoticeListTotCnt(NoticeVO vo){
		return (Integer)select("hpgmngDao.getNoticeListTotCnt", vo);
	}
	
	// 공지사항 등록
	public int insertNotice(Map<String,Object> map){
		return (Integer) insert("hpgmngDao.insertNotice", map);
	}
	
	// 공지사항 파일업로드 등록
	public void insertNoticeUpload(EgovMap map) {
		insert("hpgmngDao.insertNoticeUpload", map);
	}
	
	// 공지사항 수정
	public void updateNotice(Map<String,Object> map) {
		update("hpgmngDao.updateNotice", map);
	}
	
	// 공지사항 파일업로드 수정
	public void updateNoticeUpload(NoticeVO vo) {
		update("hpgmngDao.updateNoticeUpload", vo);
	}
	
	// 공지사항 삭제
	public void deleteNotice(int noticeNum) {
		update("hpgmngDao.deleteNotice", noticeNum);
	
	}
	// 공지사항 파일업로드 삭제
	public void deleteNoticeUpload(int noticeNum) {
		update("hpgmngDao.deleteNoticeUpload", noticeNum);
	}
	
	// 공지사항 파일 삭제구분 처리
	public void deleteNoticeUploadGbY(Map<String,Object> map) {
		update("hpgmngDao.deleteNoticeUploadGbY", map);
	}
	
	// 공지사항 파일 삭제구분 취소
	public void deleteNoticeUploadGbN(EgovMap map) {
		update("hpgmngDao.deleteNoticeUploadGbN", map);
	}
	
	// 공지사항 상세
	public EgovMap getNoticeDtl(int num){
		return (EgovMap)select("hpgmngDao.getNoticeDtl", num);
	}
	
	// 공지사항 상세 파일목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getNoticeFileDtl(int num){
		return (List<EgovMap>)list("hpgmngDao.getNoticeFileDtl", num);
	}
	
	// 자유게시판 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getFreeBoardList(FreeBrdVO vo){
		return (List<EgovMap>)list("hpgmngDao.getFreeBoardList", vo);
	}
	
	// 자유게시판 갯수
	public int getFreeBoardListTotCnt(FreeBrdVO vo){
		return (Integer)select("hpgmngDao.getFreeBoardListTotCnt", vo);
	}
	
	// 자유게시판 등록
	public int insertFreeBoard(Map<String,Object> map){
		return (Integer) insert("hpgmngDao.insertFreeBoard", map);
	}
	
	// 자유게시판 파일업로드 등록
	public void insertFreeBoardUpload(EgovMap map) {
		insert("hpgmngDao.insertFreeBoardUpload", map);
	}
	
	// 자유게시판 수정
	public void updateFreeBoard(Map<String,Object> map) {
		update("hpgmngDao.updateFreeBoard", map);
	}
	
	// 자유게시판 파일업로드 수정
	public void updateFreeBoardUpload(FreeBrdVO vo) {
		update("hpgmngDao.updateFreeBoardUpload", vo);
	}
	
	// 자유게시판 삭제
	public void deleteFreeBoard(int freeBrdNum) {
		update("hpgmngDao.deleteFreeBoard", freeBrdNum);
	
	}
	// 자유게시판 파일업로드 삭제
	public void deleteFreeBoardUpload(int freeBrdNum) {
		update("hpgmngDao.deleteFreeBoardUpload", freeBrdNum);
	}
	
	// 자유게시판 파일 삭제구분 처리
	public void deleteFreeBoardUploadGbY(Map<String,Object> map) {
		update("hpgmngDao.deleteFreeBoardUploadGbY", map);
	}
	
	// 자유게시판 파일 삭제구분 취소
	public void deleteFreeBoardUploadGbN(EgovMap map) {
		update("hpgmngDao.deleteFreeBoardUploadGbN", map);
	}
	
	// 자유게시판 상세
	public EgovMap getFreeBoardDtl(int num){
		return (EgovMap)select("hpgmngDao.getFreeBoardDtl", num);
	}
	
	// 자유게시판 상세 파일목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getFreeBoardFileDtl(int num){
		return (List<EgovMap>)list("hpgmngDao.getFreeBoardFileDtl", num);
	}

	
	// 문서자료실 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLibraryList(LibraryVO vo){
		return (List<EgovMap>)list("hpgmngDao.getLibraryList", vo);
	}
	
	// 문서자료실 갯수
	public int getLibraryListTotCnt(LibraryVO vo){
		return (Integer)select("hpgmngDao.getLibraryListTotCnt", vo);
	}
	
	// 문서자료실 등록
	public int insertLibrary(Map<String,Object> map){
		return (Integer) insert("hpgmngDao.insertLibrary", map);
	}
	
	// 문서자료실 파일업로드 등록
	public void insertLibraryUpload(EgovMap map) {
		insert("hpgmngDao.insertLibraryUpload", map);
	}
	
	// 문서자료실 수정
	public void updateLibrary(Map<String,Object> map) {
		update("hpgmngDao.updateLibrary", map);
	}
	
	// 문서자료실 파일업로드 수정
	public void updateLibraryUpload(LibraryVO vo) {
		update("hpgmngDao.updateLibraryUpload", vo);
	}
	
	// 문서자료실 삭제
	public void deleteLibrary(int noticeNum) {
		update("hpgmngDao.deleteLibrary", noticeNum);
	
	}
	// 문서자료실 파일업로드 삭제
	public void deleteLibraryUpload(int noticeNum) {
		update("hpgmngDao.deleteLibraryUpload", noticeNum);
	}
	
	// 문서자료실 파일 삭제구분 처리
	public void deleteLibraryUploadGbY(Map<String,Object> map) {
		update("hpgmngDao.deleteLibraryUploadGbY", map);
	}
	
	// 문서자료실 파일 삭제구분 취소
	public void deleteLibraryUploadGbN(EgovMap map) {
		update("hpgmngDao.deleteLibraryUploadGbN", map);
	}
	
	// 문서자료실 상세
	public EgovMap getLibraryDtl(int num){
		return (EgovMap)select("hpgmngDao.getLibraryDtl", num);
	}
	
	// 문서자료실 상세 파일목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLibraryFileDtl(int num){
		return (List<EgovMap>)list("hpgmngDao.getLibraryFileDtl", num);
	}
	
	// 센터소식 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterNewsList(NewsVO vo){
		return (List<EgovMap>)list("hpgmngDao.getCenterNewsList", vo);
	}
	
	// 센터소식 갯수
	public int getCenterNewsListTotCnt(NewsVO vo){
		return (Integer)select("hpgmngDao.getCenterNewsListTotCnt", vo);
	}
	
	// 센터소식 등록
	public int insertCenterNews(Map<String,Object> map){
		return (Integer) insert("hpgmngDao.insertCenterNews", map);
	}
	
	// 센터소식 파일업로드 등록
	public void insertCenterNewsUpload(EgovMap map) {
		insert("hpgmngDao.insertCenterNewsUpload", map);
	}
	
	// 센터소식 수정
	public void updateCenterNews(Map<String,Object> map) {
		update("hpgmngDao.updateCenterNews", map);
	}
	
	// 센터소식 파일업로드 수정
	public void updateCenterNewsUpload(NewsVO vo) {
		update("hpgmngDao.updateCenterNewsUpload", vo);
	}
	
	// 센터소식 삭제
	public void deleteCenterNews(int noticeNum) {
		update("hpgmngDao.deleteCenterNews", noticeNum);
	
	}
	// 센터소식 파일업로드 삭제
	public void deleteCenterNewsUpload(int noticeNum) {
		update("hpgmngDao.deleteCenterNewsUpload", noticeNum);
	}
	
	// 센터소식 파일 삭제구분 처리
	public void deleteCenterNewsUploadGbY(Map<String,Object> map) {
		update("hpgmngDao.deleteCenterNewsUploadGbY", map);
	}
	
	// 센터소식 파일 삭제구분 취소
	public void deleteCenterNewsUploadGbN(EgovMap map) {
		update("hpgmngDao.deleteCenterNewsUploadGbN", map);
	}
	
	// 센터소식 상세
	public EgovMap getCenterNewsDtl(int num){
		return (EgovMap)select("hpgmngDao.getCenterNewsDtl", num);
	}
	
	// 센터소식 상세 파일목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterNewsFileDtl(int num){
		return (List<EgovMap>)list("hpgmngDao.getCenterNewsFileDtl", num);
	}
	
	// 온라인상담 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getOnlineAskList(OnlineAskVO vo){
		return (List<EgovMap>)list("hpgmngDao.getOnlineAskList", vo);
	}
	
	// 온라인상담 갯수
	public int getOnlineAskListTotCnt(OnlineAskVO vo){
		return (Integer)select("hpgmngDao.getOnlineAskListTotCnt", vo);
	}
	
	// 온라인상담 등록
	public void insertOnlineAsk(OnlineAskVO vo){
		insert("hpgmngDao.insertOnlineAsk", vo);
	}
	
	// 온라인상담 답변 여부 수정
	public void updateOnlineAskAnswer(OnlineAskVO vo) {
		update("hpgmngDao.updateOnlineAskAnswer", vo);
	}
	
	// 온라인상담 수정
	public void updateOnlineAsk(OnlineAskVO vo) {
		update("hpgmngDao.updateOnlineAsk", vo);
	}
	
	// 온라인상담 삭제
	public void deleteOnlineAsk(int onlineNum) {
		update("hpgmngDao.deleteOnlineAsk", onlineNum);
	}
	
	// 온라인상담 답변 삭제
	public void deleteOnlineAskAns(int onlineNum) {
		update("hpgmngDao.deleteOnlineAskAns", onlineNum);
	}
	
	// 온라인상담 상세
	public EgovMap getOnlineAskDtl(int num){
		return (EgovMap)select("hpgmngDao.getOnlineAskDtl", num);
	}
	
	// 교육신청 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEduAppList(EduAppVO vo) {
		return (List<EgovMap>)list("hpgmngDao.getEduAppList", vo);
	}
	
	// 교육신청 갯수
	public int getEduAppListTotCnt(EduAppVO vo) {
		return (Integer)select("hpgmngDao.getEduAppListTotCnt" , vo);
	}
	
	// 교육신청 상세
	public EgovMap getEduAppDtl(int num) {
		return  (EgovMap)select("hpgmngDao.getEduAppDtl", num);
	}
	
	// 교육신청 수정
	public void updateEduApp(EduAppVO vo) {
		update("hpgmngDao.updateEduApp", vo);
	}
	
	// 팝업 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPopupList(PopupVO vo) {
		return (List<EgovMap>)list("hpgmngDao.getPopupList", vo);
	}
	
	// 팝업 갯수
	public int getPopupListTotCnt(PopupVO vo) {
		return (Integer)select("hpgmngDao.getPopupListTotCnt" , vo);
	}
	
	// 팝업 상세
	public EgovMap getPopupDtl(int num) {
		return  (EgovMap)select("hpgmngDao.getPopupDtl", num);
	}
	
	// 팝업 등록
	public void insertPopup(PopupVO vo) {
		insert("hpgmngDao.insertPopup", vo);
	}
	
	// 팝업 파일업로드 등록
	public void insertPopupUpload(PopupVO vo) {
		insert("hpgmngDao.insertPopupUpload", vo);
	}
	
	// 팝업 수정
	public void updatePopup(PopupVO vo) {
		update("hpgmngDao.updatePopup", vo);
	}
	
	// 팝업업로드 수정
	public void updatePopupUpload(PopupVO vo) {
		update("hpgmngDao.updatePopupUpload", vo);
	}
	
	// 팝업 삭제
	public void deletePopup(PopupVO vo) {
		update("hpgmngDao.deletePopup", vo);
	}
	
	// 팝업업로드 삭제
	public void deletePopupUpload(PopupVO vo) {
		update("hpgmngDao.deletePopupUpload", vo);
	}
	
//	// FAQ 목록
//	@SuppressWarnings("unchecked")
//	public List<EgovMap> getFaqList(FaqVO vo) {
//		return (List<EgovMap>)list("hpgmngDao.getFaqList", vo);
//	}
//	
//	// FAQ 갯수
//	public int getFaqListTotCnt(FaqVO vo) {
//		return (Integer)select("hpgmngDao.getFaqListTotCnt", vo);
//	}
//	
//	// FAQ 등록
//	public void insertFaq(FaqVO vo) {
//		insert("hpgmngDao.insertFaq", vo);
//	}
//		
//	// FAQ 상세
//	public EgovMap getFaqDetail(int num) {
//		return (EgovMap)select("hpgmngDao.getFaqDetail", num);
//	}
//	
//	// FAQ 수정
//	public void updateFaq(FaqVO vo) {
//		update("hpgmngDao.updateFaq", vo);
//	}
//	

}
