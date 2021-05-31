package ggsc.test5.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test5.service.Test5Service;
import ggsc.test5.service.Test5VO;

@Service("test5Service")
public class Test5ServiceImpl extends EgovAbstractServiceImpl implements Test5Service {
	
	@Resource(name="test5Dao")
    private Test5DAO test5Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest5List(Test5VO vo) {
		return test5Dao.getTest5List(vo);
	}
	
	// 갯수
	@Override
	public int getTest5ListTotCnt(Test5VO vo) {
		return test5Dao.getTest5ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest5(Test5VO vo) {
		test5Dao.insertTest5(vo);
	}
	
	// oasis 등록
	@Override
	public void insertBand(Test5VO vo) {
		if(vo.getBandCd().equals("2")) {
			test5Dao.insertOasis(vo);
			test5Dao.updateTest5(vo);
		} else if(vo.getBandCd().equals("3")) {
			test5Dao.insertRadiohead(vo);
			test5Dao.updateTest5(vo);
		} else if(vo.getBandCd().equals("4")) {
			test5Dao.insertBoowhal(vo);
			test5Dao.updateTest5(vo);
		} 
	}
	
	// 상세
	@Override
	public EgovMap getTest5Detail(Test5VO vo) {
		return test5Dao.getTest5Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest5(Test5VO vo) {
		test5Dao.updateTest5(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest5(Test5VO vo) {
		test5Dao.deleteTest5(vo);
	}
	
	
	
}








