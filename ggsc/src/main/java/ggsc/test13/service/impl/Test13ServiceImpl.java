package ggsc.test13.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test13.service.Test13Service;
import ggsc.test13.service.Test13VO;

@Service("test13Service")
public class Test13ServiceImpl extends EgovAbstractServiceImpl implements Test13Service {
	
	@Resource(name="test13Dao")
    private Test13DAO test13Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest13List(Test13VO vo) {
		return test13Dao.getTest13List(vo);
	}
	
	
	@Override
	public List<EgovMap> getAppleList(Test13VO vo) {
		return test13Dao.getAppleList(vo);
	}
	
	// 갯수
	@Override
	public int getTest13ListTotCnt(Test13VO vo) {
		return test13Dao.getTest13ListTotCnt(vo);
	}
	
	@Override
	public int getAppleListTotCnt(Test13VO vo) {
		return test13Dao.getAppleListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest13(Test13VO vo) {
		test13Dao.insertTest13(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest13Detail(Test13VO vo) {
		return test13Dao.getTest13Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest13(Test13VO vo) {
		test13Dao.updateTest13(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest13(Test13VO vo) {
		test13Dao.deleteTest13(vo);
	}
	
	
	
}








