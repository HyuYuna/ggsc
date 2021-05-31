package ggsc.test5.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test5.service.Test5VO;

@Repository("test5Dao")
public class Test5DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest5List(Test5VO vo) {
		return (List<EgovMap>)list("test5Dao.getTest5List", vo);
	}
	
	// 갯수
	public int getTest5ListTotCnt(Test5VO vo) {
		return (Integer)select("test5Dao.getTest5ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest5(Test5VO vo) {
		insert("test5Dao.insertTest5", vo);
	}
	
	// oasis 등록
	public void insertOasis(Test5VO vo) {
		insert("test5Dao.insertOasis", vo);
	}
	
	// 라디오헤드 등록
	public void insertRadiohead(Test5VO vo) {
		insert("test5Dao.insertRadiohead", vo);
	}
	
	public void insertBoowhal(Test5VO vo) {
		insert("test5Dao.insertBoowhal", vo);
	}
	
	// 상세
	public EgovMap getTest5Detail(Test5VO vo) {
		return (EgovMap)select("test5Dao.getTest5Detail", vo);
	}
	
	// 수정
	public void updateTest5(Test5VO vo) {
		update("test5Dao.updateTest5", vo);
	}
	
	// 삭제
	public void deleteTest5(Test5VO vo) {
		delete("test5Dao.deleteTest5", vo);
	}
	
}
	