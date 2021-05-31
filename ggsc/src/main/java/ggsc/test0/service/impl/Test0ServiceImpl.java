package ggsc.test0.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test0.service.Test0Service;
import ggsc.test0.service.Test0VO;

@Service("test0Service")
public class Test0ServiceImpl extends EgovAbstractServiceImpl implements Test0Service {
	
	@Resource(name="test0Dao")
    private Test0DAO test0Dao;
	
	
	// 목록
	@Override
	public List<EgovMap> getTest0List(Test0VO vo) {
		return test0Dao.getTest0List(vo);
	}
	
	// 갯수
	@Override
	public int getTest0ListTotCnt(Test0VO vo) {
		return test0Dao.getTest0ListTotCnt(vo);
	}
	
	public int getClassTest(Test0VO vo) {
		return test0Dao.getClassTest(vo);
	}
	
	// 등록
	public void insertYsmHcd(Test0VO vo) {
		test0Dao.insertYsmHcd(vo);
	}
	
	
	public void insertYsmMcd(Test0VO vo){
		test0Dao.insertYsmMcd(vo);
	}
	
	
	public List<EgovMap> getTest0HList(Test0VO vo){
		return test0Dao.getTest0HList(vo);
	}
	
	
	public List<EgovMap> getTest0MList(Test0VO vo){
		return test0Dao.getTest0MList(vo);
	}
	
	
}








