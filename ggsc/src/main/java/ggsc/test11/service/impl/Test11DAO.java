package ggsc.test11.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test11.service.Test11VO;

@Repository("test11Dao")
public class Test11DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest11List(Test11VO vo) {
		return (List<EgovMap>)list("test11Dao.getTest11List", vo);
	}
	
	// 갯수
	public int getTest11ListTotCnt(Test11VO vo) {
		return (Integer)select("test11Dao.getTest11ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest11(Test11VO vo) {
		insert("test11Dao.insertTest11", vo);
	}
	
	// 상세
	public EgovMap getTest11Detail(Test11VO vo) {
		return (EgovMap)select("test11Dao.getTest11Detail", vo);
	}
	
	// 수정
	public void updateTest11(Test11VO vo) {
		update("test11Dao.updateTest11", vo);
	}
	
	// 삭제
	public void deleteTest11(Test11VO vo) {
		delete("test11Dao.deleteTest11", vo);
	}
	
}
	