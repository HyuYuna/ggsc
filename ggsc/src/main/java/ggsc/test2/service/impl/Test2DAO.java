package ggsc.test2.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test2.service.Test2VO;

@Repository("test2Dao")
public class Test2DAO extends EgovAbstractDAO {
	
	// 목록(select)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest2SelectList(Test2VO vo) {
		return (List<EgovMap>)list("test2Dao.getTest2SelectList", vo);
	}

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest2List(Test2VO vo) {
		return (List<EgovMap>)list("test2Dao.getTest2List", vo);
	}
	
	// 갯수
	public int getTest2ListTotCnt(Test2VO vo) {
		return (Integer)select("test2Dao.getTest2ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest2(Test2VO vo) {
		insert("test2Dao.insertTest2", vo);
	}
	
	// 상세
	public EgovMap getTest2Detail(int num) {
		return (EgovMap)select("test2Dao.getTest2Detail", num);
	}
	
	// 수정
	public void updateTest2(Test2VO vo) {
		update("test2Dao.updateTest2", vo);
	}
	
	// 삭제
	public void deleteTest2(Test2VO vo) {
		delete("test2Dao.deleteTest2", vo);
	}
	
	public int narcissusCheck(String title) {
		return (Integer)select("test2Dao.narcissusCheck", title);
	}
	
	
	
}
	