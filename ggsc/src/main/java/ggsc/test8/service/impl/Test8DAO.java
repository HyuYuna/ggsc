package ggsc.test8.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test8.service.Test8VO;

@Repository("test8Dao")
public class Test8DAO extends EgovAbstractDAO {
	

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest8StateList(Test8VO vo) {
		return (List<EgovMap>)list("test8Dao.getTest8StateList", vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getYumiStateList(Test8VO vo) {
		return (List<EgovMap>)list("test8Dao.getYumiStateList" , vo);
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAppleStateList(Test8VO vo) {
		return (List<EgovMap>)list("test8Dao.getAppleStateList" , vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getYsmStateList(Test8VO vo) {
		return (List<EgovMap>)list("test8Dao.getYsmStateList" , vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getRandomStateList(Test8VO vo) {
		return (List<EgovMap>)list("test8Dao.getRandomStateList" , vo);
	}
	
	
	
}
	