package ggsc.test3.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test3.service.Test3Service;
import ggsc.test3.service.Test3VO;

@Service("test3Service")
public class Test3ServiceImpl extends EgovAbstractServiceImpl implements Test3Service {
	
	@Resource(name="test3Dao")
    private Test3DAO test3Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest3List(Test3VO vo) {
		return test3Dao.getTest3List(vo);
	}
	
	// 갯수
	@Override
	public int getTest3ListTotCnt(Test3VO vo) {
		return test3Dao.getTest3ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertYunaUser(Test3VO vo) {
		test3Dao.insertYunaUser(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest3Detail(String ysmId) {
		return test3Dao.getTest3Detail(ysmId);
	}
	
	// 수정
	@Override
	public void updateTest3(Test3VO vo) {
		test3Dao.updateTest3(vo);
	}
	
	@Override
	public void updateYunaYn(Test3VO vo) {
		test3Dao.updateYunaYn(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest3(Test3VO vo) {
		test3Dao.deleteTest3(vo);
	}
	
	@Override
	public void insertSecurity(Test3VO vo) {
		int year = Integer.parseInt(vo.getYear());
		vo.setYear2(year+1);
		test3Dao.insertSecurity(vo);
	}
	
	
	
}








