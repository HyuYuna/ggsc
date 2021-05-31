package ggsc.test6.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test6.service.Test6Service;
import ggsc.test6.service.Test6VO;

@Service("test6Service")
public class Test6ServiceImpl extends EgovAbstractServiceImpl implements Test6Service {
	
	@Resource(name="test6Dao")
    private Test6DAO test6Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest6List(Test6VO vo) {
		return test6Dao.getTest6List(vo);
	}
	
	// 갯수
	@Override
	public int getTest6ListTotCnt(Test6VO vo) {
		return test6Dao.getTest6ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest6(Test6VO vo) {
		test6Dao.insertTest6(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest6Detail(Test6VO vo) {
		return test6Dao.getTest6Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest6(Test6VO vo) {
		test6Dao.updateTest6(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest6(Test6VO vo) {
		test6Dao.deleteTest6(vo);
	}
	
	
	
}








