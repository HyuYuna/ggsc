package ggsc.test7.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test6.service.Test6VO;
import ggsc.test7.service.Test7VO;
import ggsc.test7.service.yunaInfoVO;

@Repository("test7Dao")
public class Test7DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest7List(Test6VO vo) {
		return (List<EgovMap>)list("test7Dao.getTest7List", vo);
	}
	
	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest7G2List(Test6VO vo) {
		return (List<EgovMap>)list("test7Dao.getTest7G2List", vo);
	}
	
	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest7G3List(Test6VO vo) {
		return (List<EgovMap>)list("test7Dao.getTest7G3List", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getNoinGroupList(Test6VO vo) {
		return (List<EgovMap>)list("test7Dao.getNoinGroupList" , vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> findYunaPopup(yunaInfoVO vo){
		return (List<EgovMap>)list("test7Dao.findYunaPopup", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAddRequestList(Test6VO vo) {
		return (List<EgovMap>)list("test7Dao.getAddRequestList", vo);
	}
	
	// 갯수
	public int getTest7ListTotCnt(Test6VO vo) {
		return (Integer)select("test7Dao.getTest7ListTotCnt", vo);
	}
	
	public int getNoinGroupTotCnt(Test6VO vo) {
		return (Integer)select("test7Dao.getNoinGroupTotCnt", vo);
	}
	
	// 등록
	public void insertTest7(Test6VO vo) {
		insert("test7Dao.insertTest7", vo);
	}
	
	public void insertNoinClose(Test6VO vo) {
		insert("test7Dao.insertNoinClose", vo);
	}
	
	public void insertNoinGroup(Test6VO vo) {
		insert("test7Dao.insertNoinGroup", vo);
	}
	
	public void insertAddInReq(Test7VO vo) {
		insert("test7Dao.insertAddInReq", vo);
	}
	
	public void insertAddOutReq(Test7VO vo) {
		insert("test7Dao.insertAddOutReq", vo);
	}
	
	public void insertNoinGroupReply(Test6VO vo) {
		insert("test7Dao.insertNoinGroupReply", vo);
	}
	
	// 상세
	public EgovMap getTest7Detail(Test6VO vo) {
		return (EgovMap)select("test7Dao.getTest7Detail", vo);
	}
	
	// 수정
	public void updateTest7(Test6VO vo) {
		update("test7Dao.updateTest7", vo);
	}
	
	public void updateNoinGroup(Test6VO vo) {
		update("test7Dao.updateNoinGroup", vo);
	}
	
	public void updateNoinGroupReply(Test6VO vo) {
		update("test7Dao.updateNoinGroupReply", vo);
	}
	
	public void updateAddInReq(Test7VO vo) {
		update("test7Dao.updateAddInReq", vo);
	}
	
	public void updateAddOutReq(Test7VO vo) {
		update("test7Dao.updateAddOutReq", vo);
	}
	
	public void updateNgAnswerYn(Test6VO vo) {
		update("test7Dao.updateNgAnswerYn" , vo);
	}
	
	// 삭제
	public void deleteTest7(Test6VO vo) {
		delete("test7Dao.deleteTest7", vo);
	}
	
	
	public void deleteNoinGroup(Test6VO vo) {
		delete("test7Dao.deleteNoinGroup", vo);
	}
	
	
	public void deleteNoinGroupReply(Test6VO vo) {
		delete("test7Dao.deleteNoinGroupReply", vo);
	}
	
	public void deleteNoinGroupReplyAs(Test6VO vo) {
		delete("test7Dao.deleteNoinGroupReplyAs", vo);
	}
	
	
	public int getTest7RegCheckAjax(int ysmNo) {
		return (Integer)select("test7Dao.getTest7RegCheckAjax", ysmNo);
	}
	
	public int getFindYunaTotCnt(yunaInfoVO vo) {
		return (Integer)select("test7Dao.getFindYunaTotCnt" , vo);
	}
	
	public int getAddRequestTotCnt(Test6VO vo) {
		return (Integer)select("test7Dao.getAddRequestTotCnt", vo);
	}
	
	public EgovMap getNoinGroupDtl(int num) {
		return (EgovMap) select("test7Dao.getNoinGroupDtl",num);
	}
	
	public EgovMap getNoinGroupReplyDtl(int num) {
		return (EgovMap) select("test7Dao.getNoinGroupReplyDtl",num);
	}
	
	
	public EgovMap getAddRequestDetail(Test7VO vo) {
		return (EgovMap) select("test7Dao.getAddRequestDetail" , vo);
	}
	
}
	