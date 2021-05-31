package ggsc.test3.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test3.service.Test3VO;

@Repository("test3Dao")
public class Test3DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest3List(Test3VO vo) {
		return (List<EgovMap>)list("test3Dao.getTest3List", vo);
	}
	
	// 갯수
	public int getTest3ListTotCnt(Test3VO vo) {
		return (Integer)select("test3Dao.getTest3ListTotCnt", vo);
	}
	
	// 등록
	public void insertYunaUser(Test3VO vo) {
		insert("test3Dao.insertYunaUser", vo);
	}
	
	
	public void insertSecurity(Test3VO vo) {
		insert("test3Dao.insertSecurity", vo);
	}
	
	
	// 상세
	public EgovMap getTest3Detail(String ysmId) {
		return (EgovMap)select("test3Dao.getTest3Detail", ysmId);
	}
	
	// 수정
	public void updateTest3(Test3VO vo) {
		update("test3Dao.updateTest3", vo);
	}
	
	
	public void updateYunaYn(Test3VO vo) {
		update("test3Dao.updateYunaYn", vo);
	}
	
	// 삭제
	public void deleteTest3(Test3VO vo) {
		delete("test3Dao.deleteTest3", vo);
	}
	
}
	