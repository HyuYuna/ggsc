package ggsc.test11.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test11.service.Test11Service;
import ggsc.test11.service.Test11VO;

@Service("test11Service")
public class Test11ServiceImpl extends EgovAbstractServiceImpl implements Test11Service {
	
	@Resource(name="test11Dao")
    private Test11DAO test11Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest11List(Test11VO vo) {
		return test11Dao.getTest11List(vo);
	}
	
	// 갯수
	@Override
	public int getTest11ListTotCnt(Test11VO vo) {
		return test11Dao.getTest11ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest11(Test11VO vo) {
		test11Dao.insertTest11(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest11Detail(Test11VO vo) {
		return test11Dao.getTest11Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest11(Test11VO vo) {
		test11Dao.updateTest11(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest11(Test11VO vo) {
		test11Dao.deleteTest11(vo);
	}
	
	
	
}








