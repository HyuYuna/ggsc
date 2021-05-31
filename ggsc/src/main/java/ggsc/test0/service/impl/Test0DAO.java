package ggsc.test0.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test0.service.Test0VO;

@Repository("test0Dao")
public class Test0DAO extends EgovAbstractDAO {
	

	// 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest0List(Test0VO vo) {
		return (List<EgovMap>)list("test0Dao.getTest0List", vo);
	}
	
	// 갯수
	public int getTest0ListTotCnt(Test0VO vo) {
		return (Integer)select("test0Dao.getTest0ListTotCnt", vo);
	}
	
	public int getClassTest(Test0VO vo) {
		return (Integer)select("test0Dao.getClassTest",vo);
	}
	
	// 등록
	public void insertYsmHcd(Test0VO vo) {
		insert("test0Dao.insertYsmHcd",vo);
	}
	
	
	public void insertYsmMcd(Test0VO vo){
		insert("test0Dao.insertYsmMcd",vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest0HList(Test0VO vo){
		return (List<EgovMap>)list("test0Dao.getTest0HList",vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTest0MList(Test0VO vo){
		return (List<EgovMap>)list("test0Dao.getTest0MList",vo);
	}
	
}
	