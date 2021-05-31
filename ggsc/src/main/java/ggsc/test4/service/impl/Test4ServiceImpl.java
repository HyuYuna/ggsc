package ggsc.test4.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test4.service.Test4Service;
import ggsc.test4.service.Test4VO;
import ggsc.test5.service.Test5VO;

@Service("test4Service")
public class Test4ServiceImpl extends EgovAbstractServiceImpl implements Test4Service {
	
	@Resource(name="test4Dao")
    private Test4DAO test4Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest4List(Test4VO vo) {
		return test4Dao.getTest4List(vo);
	}
	
	// 갯수
	@Override
	public int getTest4ListTotCnt(Test4VO vo) {
		return test4Dao.getTest4ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest4(Test4VO vo) {
		test4Dao.insertTest4(vo);
	}
	
	// 아이디 중복 확인
	@Override
	public int idCheck(String ysmId) {
		return test4Dao.idCheck(ysmId);
	}
	
	// 유저 등록
	@Override
	public void insertYsmUser(Test4VO vo) {
		test4Dao.insertYsmUser(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest4Detail(String ysmNo) {
		return test4Dao.getTest4Detail(ysmNo);
	}
	
	// 수정
	@Override
	public void updateTest4(Test4VO vo) {
		test4Dao.updateTest4(vo);
	}
	
	// 유저 수정
	@Override
	public void updateYsmUser(Test4VO vo) {
		test4Dao.updateYsmUser(vo);
	}
	
	
	@Override
	public void updateYsmYn(Test4VO vo) {
		test4Dao.updateYsmYn(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest4(Test4VO vo) {
		test4Dao.deleteTest4(vo);
	}
	
	// 유저 삭제
	@Override
	public void deleteYsmUser(Test4VO vo) {
		test4Dao.deleteYsmUser(vo);
	}
	
	// 신청 확인
	@Override
	public void updateConfirm(Test4VO vo) {
		test4Dao.updateConfirm(vo);
		Test5VO test5VO = new Test5VO();
		test5VO.setYsmNm(vo.getYsmNm());
		test5VO.setYsmId(vo.getYsmId());
		test5VO.setYsmNo(vo.getYsmNo());
		test5VO.setNarcissus(vo.getNarcissus());
		test5VO.setFate(vo.getFate());
		test5VO.setRegId(vo.getRegId());
		test4Dao.insertDust(test5VO);
	}
	
	@Override
	public List<EgovMap> findYsmUser(Test4VO vo){
		return test4Dao.findYsmUser(vo);
	}
	
	@Override
	public int getFindYsmUserTotCnt(Test4VO vo) {
		return test4Dao.getFindYsmUserTotCnt(vo);
	}


	
	
	
}








