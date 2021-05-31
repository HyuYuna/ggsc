package ggsc.test4.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test4.service.Test4VO;
import ggsc.test5.service.Test5VO;

@Repository("test4Dao")
public class Test4DAO extends EgovAbstractDAO {
	
	
	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest4List(Test4VO vo) {
		return (List<EgovMap>)list("test4Dao.getTest4List", vo);
	}
	
	
	// 갯수
	public int getTest4ListTotCnt(Test4VO vo) {
		return (Integer)select("test4Dao.getTest4ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest4(Test4VO vo) {
		insert("test4Dao.insertTest4", vo);
	}
	
	// 아이디 중복 확인
	public int idCheck(String ysmId) {
		return (Integer)select("test4Dao.idCheck", ysmId);
	}
	
	// 유저등록
	public void insertYsmUser(Test4VO vo) {
		insert("test4Dao.insertYsmUser", vo);
	}
	
	// 상세
	public EgovMap getTest4Detail(String ysmNo) {
		return (EgovMap)select("test4Dao.getTest4Detail", ysmNo);
	}
	
	// 수정
	public void updateTest4(Test4VO vo) {
		update("test4Dao.updateTest4", vo);
	}
	
	//유저 수정
	public void updateYsmUser(Test4VO vo) {
		update("test4Dao.updateYsmUser", vo);
	}	
	
	
	//유저 수정
	public void updateYsmYn(Test4VO vo) {
		update("test4Dao.updateYsmYn", vo);
	}	
	
	// 삭제
	public void deleteTest4(Test4VO vo) {
		update("test4Dao.deleteTest4", vo);
	}
	
	//유저 삭제
	public void deleteYsmUser(Test4VO vo) {
		update("test4Dao.deleteYsmUser", vo);
	}	

	// 신청 확인
	public void updateConfirm(Test4VO vo) {
		update("test4Dao.updateConfirm", vo);
	}	
	
	public void insertDust(Test5VO vo) {
		insert("test4Dao.insertDust", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> findYsmUser(Test4VO vo){
		return (List<EgovMap>)list("test4Dao.findYsmUser", vo);
	}
	
	public int getFindYsmUserTotCnt(Test4VO vo) {
		return (Integer)select("test4Dao.getFindYsmUserTotCnt",vo);
	}
	
}
	