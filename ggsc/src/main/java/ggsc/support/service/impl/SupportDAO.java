package ggsc.support.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.daou.ppurio.mmsVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.support.service.FaqVO;
import ggsc.support.service.PdfVO;
import ggsc.support.service.RescRoomVO;
import ggsc.support.service.SignVO;
import ggsc.support.service.SurveyMngVO;
import ggsc.support.service.UserManualVO;
 
@Repository("supportDao")
public class SupportDAO extends EgovAbstractDAO {

	
	// PDF 다운로드
	public EgovMap PDFDownload(PdfVO vo, String sqlName) {
		return (EgovMap)select("supportDao." + sqlName, vo);
	}
	
	// FAQ 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getFaqList(FaqVO vo) {
		return (List<EgovMap>)list("supportDao.getFaqList", vo);
	}
	
	// FAQ 갯수
	public int getFaqListTotCnt(FaqVO vo) {
		return (Integer)select("supportDao.getFaqListTotCnt", vo);
	}
	
	// FAQ 등록
	public void insertFaq(FaqVO vo) {
		insert("supportDao.insertFaq", vo);
	}
		
	// FAQ 상세
	public EgovMap getFaqDetail(int num) {
		return (EgovMap)select("supportDao.getFaqDetail", num);
	}
	
	// FAQ 수정
	public void updateFaq(FaqVO vo) {
		update("supportDao.updateFaq", vo);
	}
	
	// 자료실 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getRescRoomList(RescRoomVO vo){
		return (List<EgovMap>)list("supportDao.getRescRoomList", vo);
	}
	
	// 자료실 갯수
	public int getRescRoomListTotCnt(RescRoomVO vo){
		return (Integer)select("supportDao.getRescRoomListTotCnt", vo);
	}
	
	// 자료실 등록
	public int insertRescRoom(Map<String,Object> map){
		return (Integer) insert("supportDao.insertRescRoom", map);
	}
	
	// 자료실 파일업로드 등록
	public void insertRescRoomUpload(EgovMap map) {
		insert("supportDao.insertRescRoomUpload", map);
	}
	
	// 자료실 수정
	public void updateRescRoom(Map<String,Object> map) {
		update("supportDao.updateRescRoom", map);
	}
	
	// 자료실 파일업로드 수정
	public void updateRescRoomUpload(RescRoomVO vo) {
		update("supportDao.updateRescRoomUpload", vo);
	}
	
	// 자료실 삭제
	public void deleteRescRoom(int rescRoomNum) {
		update("supportDao.deleteRescRoom", rescRoomNum);
	
	}
	// 자료실 파일업로드 삭제
	public void deleteRescRoomUpload(int rescRoomNum) {
		update("supportDao.deleteRescRoomUpload", rescRoomNum);
	}
	
	// 자료실 파일 삭제구분 처리
	public void deleteRescRoomUploadGbY(Map<String,Object> map) {
		update("supportDao.deleteRescRoomUploadGbY", map);
	}
	
	// 자료실 파일 삭제구분 취소
	public void deleteRescRoomUploadGbN(EgovMap map) {
		update("supportDao.deleteRescRoomUploadGbN", map);
	}
	
	// 자료실 상세
	public EgovMap getRescRoomDtl(int num){
		return (EgovMap)select("supportDao.getRescRoomDtl", num);
	}
	
	// 자료실 상세 파일목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getRescRoomFileDtl(int num){
		return (List<EgovMap>)list("supportDao.getRescRoomFileDtl", num);
	}
	
	// 사용자메뉴얼 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getUserManualList(UserManualVO vo) {
		return (List<EgovMap>)list("supportDao.getUserManualList", vo);
	}
	
	// 사용자메뉴얼 갯수
	public int getUserManualListTotCnt(UserManualVO vo) {
		return (Integer)select("supportDao.getUserManualListTotCnt", vo);
	}
	
	// 사용자메뉴얼 상세
	public EgovMap getUserManualDetail(int num) {
		return (EgovMap)select("supportDao.getUserManualDetail", num);
	}
	
	// 사용자메뉴얼 등록
	public void insertUserManual(UserManualVO vo) {
		insert("supportDao.insertUserManual", vo);
	}
	
	// 사용자메뉴얼 파일업로드 등록
	public void insertUserManualUpload(UserManualVO vo) {
		insert("supportDao.insertUserManualUpload", vo);
	}
	
	// 사용자메뉴얼 파일업로드 수정
	public void updateUserManualUpload(UserManualVO vo) {
		update("supportDao.updateUserManualUpload", vo);
	}
		
	// 사용자메뉴얼 수정
	public void updateUserManual(UserManualVO vo) {
		update("supportDao.updateUserManual", vo);
	}
	
	// 설문관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getSurveyMngList(SurveyMngVO vo) {
		return (List<EgovMap>)list("supportDao.getSurveyMngList", vo);
	}
	
	// 설문관리 갯수
	public int getSurveyMngListTotCnt(SurveyMngVO vo) {
		return (Integer)select("supportDao.getSurveyMngListTotCnt", vo);
	}
	
	// 설문관리 상세
	public EgovMap getSurveyMngDetail(int num) {
		return (EgovMap)select("supportDao.getSurveyMngDetail", num);
	}
	
	// 설문관리 등록
	public void insertSurveyMng(SurveyMngVO vo) {
		insert("supportDao.insertSurveyMng", vo);
	}
	
	// 설문관리 수정
	public void updateSurveyMng(SurveyMngVO vo) {
		update("supportDao.updateSurveyMng", vo);
	}
	
	// 서명관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getSignList(SignVO vo) {
		return (List<EgovMap>)list("supportDao.getSignList", vo);
	}
	
	// 서명관리 갯수
	public int getSignListTotCnt(SignVO vo) {
		return (Integer)select("supportDao.getSignListTotCnt", vo);
	}
	
	// 서명관리 등록
	public void insertSign(SignVO vo) {
		insert("supportDao.insertSign", vo);
	}
	
	// 서명관리 상세
	public EgovMap getSignDetail(SignVO vo) {
		return (EgovMap)select("supportDao.getSignDetail", vo);
	}
	
	// 서명관리 수정
	public void updateSign(SignVO vo) {
		update("supportDao.updateSign", vo);
	}
	
	
	// 문자 발송내역 조회
	@SuppressWarnings("unchecked")
	public List<EgovMap> listMms(mmsVO vo) {
		return (List<EgovMap>)list("supportDao.listMms", vo);
	}
	
	// 문자 발송내역 갯수
	public int countMms(mmsVO vo) {
		return (Integer)select("supportDao.countMms", vo);
	}
	
	// 문자 발송
	public void insertMms(mmsVO vo) {
		insert("supportDao.insertMms", vo);
	}
	
	// 문자 발송내역 상세
	public EgovMap selectMms(mmsVO vo) {
		return (EgovMap)select("supportDao.selectMms", vo);
	}
}
