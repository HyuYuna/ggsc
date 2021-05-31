package ggsc.test2.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test2.service.Test2Service;
import ggsc.test2.service.Test2VO;

@Service("test2Service")
public class Test2ServiceImpl extends EgovAbstractServiceImpl implements Test2Service {
	
	@Resource(name="test2Dao")
    private Test2DAO test2Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest2SelectList(Test2VO vo) {
		return test2Dao.getTest2SelectList(vo);
	}
	
	// 목록
	@Override
	public List<EgovMap> getTest2List(Test2VO vo) {
		return test2Dao.getTest2List(vo);
	}
	
	// 갯수
	@Override
	public int getTest2ListTotCnt(Test2VO vo) {
		return test2Dao.getTest2ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest2(Test2VO vo) {
		test2Dao.insertTest2(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest2Detail(int num) {
		return test2Dao.getTest2Detail(num);
	}
	
	// 수정
	@Override
	public void updateTest2(Test2VO vo) {
		test2Dao.updateTest2(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest2(Test2VO vo) {
		test2Dao.deleteTest2(vo);
	}
	
	@Override
	public int narcissusCheck(String title) {
		return test2Dao.narcissusCheck(title);
	}
	
	
	
}








