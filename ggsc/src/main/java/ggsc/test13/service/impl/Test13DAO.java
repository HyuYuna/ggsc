package ggsc.test13.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test13.service.Test13VO;

@Repository("test13Dao")
public class Test13DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest13List(Test13VO vo) {
		return (List<EgovMap>)list("test13Dao.getTest13List", vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAppleList(Test13VO vo) {
		return (List<EgovMap>)list("test13Dao.getAppleList" , vo);
	}
	
	// 갯수
	public int getTest13ListTotCnt(Test13VO vo) {
		return (Integer)select("test13Dao.getTest13ListTotCnt", vo);
	}
	
	public int getAppleListTotCnt(Test13VO vo) {
		return (Integer)select("test13Dao.getAppleListTotCnt" , vo);
	}
	
	// 등록
	public void insertTest13(Test13VO vo) {
		insert("test13Dao.insertTest13", vo);
	}
	
	// 상세
	public EgovMap getTest13Detail(Test13VO vo) {
		return (EgovMap)select("test13Dao.getTest13Detail", vo);
	}
	
	// 수정
	public void updateTest13(Test13VO vo) {
		update("test13Dao.updateTest13", vo);
	}
	
	// 삭제
	public void deleteTest13(Test13VO vo) {
		delete("test13Dao.deleteTest13", vo);
	}
	
}
	