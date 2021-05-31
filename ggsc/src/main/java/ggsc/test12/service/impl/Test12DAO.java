package ggsc.test12.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test12.service.Test12VO;

@Repository("test12Dao")
public class Test12DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest12List(Test12VO vo) {
		return (List<EgovMap>)list("test12Dao.getTest12List", vo);
	}
	
	// 갯수
	public int getTest12ListTotCnt(Test12VO vo) {
		return (Integer)select("test12Dao.getTest12ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest12(Test12VO vo) {
		insert("test12Dao.insertTest12", vo);
	}
	
	// 상세
	public EgovMap getTest12Detail(Test12VO vo) {
		return (EgovMap)select("test12Dao.getTest12Detail", vo);
	}
	
	// 수정
	public void updateTest12(Test12VO vo) {
		update("test12Dao.updateTest12", vo);
	}
	
	// 삭제
	public void deleteTest12(Test12VO vo) {
		delete("test12Dao.deleteTest12", vo);
	}
	
}
	