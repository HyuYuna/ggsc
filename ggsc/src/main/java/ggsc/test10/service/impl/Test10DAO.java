package ggsc.test10.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test10.service.Test10VO;

@Repository("test10Dao")
public class Test10DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest10List(Test10VO vo) {
		return (List<EgovMap>)list("test10Dao.getTest10List", vo);
	}
	
	// 갯수
	public int getTest10ListTotCnt(Test10VO vo) {
		return (Integer)select("test10Dao.getTest10ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest10(Test10VO vo) {
		insert("test10Dao.insertTest10", vo);
	}
	
	// 상세
	public EgovMap getTest10Detail(Test10VO vo) {
		return (EgovMap)select("test10Dao.getTest10Detail", vo);
	}
	
	// 수정
	public void updateTest10(Test10VO vo) {
		update("test10Dao.updateTest10", vo);
	}
	
	// 삭제
	public void deleteTest10(Test10VO vo) {
		delete("test10Dao.deleteTest10", vo);
	}
	
}
	