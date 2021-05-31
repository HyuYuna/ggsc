package ggsc.test6.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test6.service.Test6VO;

@Repository("test6Dao")
public class Test6DAO extends EgovAbstractDAO {

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest6List(Test6VO vo) {
		return (List<EgovMap>)list("test6Dao.getTest6List", vo);
	}
	
	// 갯수
	public int getTest6ListTotCnt(Test6VO vo) {
		return (Integer)select("test6Dao.getTest6ListTotCnt", vo);
	}
	
	// 등록
	public void insertTest6(Test6VO vo) {
		insert("test6Dao.insertTest6", vo);
	}
	
	// 상세
	public EgovMap getTest6Detail(Test6VO vo) {
		return (EgovMap)select("test6Dao.getTest6Detail", vo);
	}
	
	// 수정
	public void updateTest6(Test6VO vo) {
		update("test6Dao.updateTest6", vo);
	}
	
	// 삭제
	public void deleteTest6(Test6VO vo) {
		delete("test6Dao.deleteTest6", vo);
	}
	
}
	