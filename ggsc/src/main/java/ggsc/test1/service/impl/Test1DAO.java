package ggsc.test1.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test1.service.Test1VO;

@Repository("test1Dao")
public class Test1DAO extends EgovAbstractDAO {
	
	// 목록(select)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest1SelectList(Test1VO vo) {
		return (List<EgovMap>)list("test1Dao.getTest1SelectList", vo);
	}

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest1List(Test1VO vo) {
		return (List<EgovMap>)list("test1Dao.getTest1List", vo);
	}
	
	// 갯수
	public int getTest1ListTotCnt(Test1VO vo) {
		return (Integer)select("test1Dao.getTest1ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest1(Test1VO vo) {
		insert("test1Dao.insertTest1", vo);
	}
	
	// 상세
	public EgovMap getTest1Detail(int num) {
		return (EgovMap)select("test1Dao.getTest1Detail", num);
	}
	
	// 수정
	public void updateTest1(Test1VO vo) {
		update("test1Dao.updateTest1", vo);
	}
	
	// 삭제
	public void deleteTest1(Test1VO vo) {
		delete("test1Dao.deleteTest1", vo);
	}
	
}
	