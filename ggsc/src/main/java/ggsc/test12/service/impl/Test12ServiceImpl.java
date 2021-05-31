package ggsc.test12.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test12.service.Test12Service;
import ggsc.test12.service.Test12VO;

@Service("test12Service")
public class Test12ServiceImpl extends EgovAbstractServiceImpl implements Test12Service {
	
	@Resource(name="test12Dao")
    private Test12DAO test12Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest12List(Test12VO vo) {
		return test12Dao.getTest12List(vo);
	}
	
	// 갯수
	@Override
	public int getTest12ListTotCnt(Test12VO vo) {
		return test12Dao.getTest12ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest12(Test12VO vo) {
		test12Dao.insertTest12(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest12Detail(Test12VO vo) {
		return test12Dao.getTest12Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest12(Test12VO vo) {
		test12Dao.updateTest12(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest12(Test12VO vo) {
		test12Dao.deleteTest12(vo);
	}
	
	
	
}








