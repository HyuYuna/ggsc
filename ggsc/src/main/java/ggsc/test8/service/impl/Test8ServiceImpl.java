package ggsc.test8.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test8.service.Test8Service;
import ggsc.test8.service.Test8VO;

@Service("test8Service")
public class Test8ServiceImpl extends EgovAbstractServiceImpl implements Test8Service {
	
	@Resource(name="test8Dao")
    private Test8DAO test8Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest8StateList(Test8VO vo) {
		return test8Dao.getTest8StateList(vo);
	}
	
	
	@Override
	public List<EgovMap> getYumiStateList(Test8VO vo) {
		return test8Dao.getYumiStateList(vo);
	}
	
	
	@Override
	public List<EgovMap> getAppleStateList(Test8VO vo) {
		return test8Dao.getAppleStateList(vo);
	}
	
	
	@Override
	public List<EgovMap> getYsmStateList(Test8VO vo) {
		return test8Dao.getYsmStateList(vo);
	}
	
	
	@Override
	public List<EgovMap> getRandomStateList(Test8VO vo) {
		return test8Dao.getRandomStateList(vo);
	}
	
	
	
}








