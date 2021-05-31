package ggsc.test7.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test6.service.Test6VO;
import ggsc.test7.service.Test7Service;
import ggsc.test7.service.Test7VO;
import ggsc.test7.service.yunaInfoVO;

@Service("test7Service")
public class Test7ServiceImpl extends EgovAbstractServiceImpl implements Test7Service {
	
	@Resource(name="test7Dao")
    private Test7DAO test7Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest7List(Test6VO vo) {
		return test7Dao.getTest7List(vo);
	}
	
	// 목록
	@Override
	public List<EgovMap> getTest7G2List(Test6VO vo) {
		return test7Dao.getTest7G2List(vo);
	}
		
	// 목록
	@Override
	public List<EgovMap> getTest7G3List(Test6VO vo) {
		return test7Dao.getTest7G3List(vo);
	}
	
	@Override
	public List<EgovMap> getNoinGroupList(Test6VO vo) {
		return test7Dao.getNoinGroupList(vo);
	}
	
	@Override
	public List<EgovMap> getAddRequestList(Test6VO vo) {
		return test7Dao.getAddRequestList(vo);
	}
	
	
	@Override
	public List<EgovMap> findYunaPopup(yunaInfoVO vo) {
		return test7Dao.findYunaPopup(vo);
	}

	// 갯수
	@Override
	public int getTest7ListTotCnt(Test6VO vo) {
		return test7Dao.getTest7ListTotCnt(vo);
	}
	
	@Override
	public int getNoinGroupTotCnt(Test6VO vo) {
		return test7Dao.getNoinGroupTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest7(Test6VO vo) {
		test7Dao.insertTest7(vo);
	}
	
	@Override
	public void insertNoinClose(Test6VO vo) {
		test7Dao.insertNoinClose(vo);
	}
	
	@Override
	public void insertAddInReq(Test7VO vo) {
		test7Dao.insertAddInReq(vo);
	}
	
	
	@Override
	public void insertAddOutReq(Test7VO vo) {
		test7Dao.insertAddOutReq(vo);
	}
	
	
	@Override
	public void insertNoinGroup(Test6VO vo) {
		test7Dao.insertNoinGroup(vo);
	}
	
	@Override
	public void insertNoinGroupReply(Test6VO vo) {
		test7Dao.insertNoinGroupReply(vo);
		test7Dao.updateNgAnswerYn(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest7Detail(Test6VO vo) {
		return test7Dao.getTest7Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest7(Test6VO vo) {
		test7Dao.updateTest7(vo);
	}
	
	public void updateNoinGroup(Test6VO vo) {
		test7Dao.updateNoinGroup(vo);
	}
	
	public void updateAddInReq(Test7VO vo) {
		test7Dao.updateAddInReq(vo);
	}
	
	
	public void updateAddOutReq(Test7VO vo) {
		test7Dao.updateAddOutReq(vo);
	}
	
	
	public void updateNoinGroupReply(Test6VO vo) {
		test7Dao.updateNoinGroupReply(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest7(Test6VO vo) {
		test7Dao.deleteTest7(vo);
	}
	
	
	@Override
	public void deleteNoinGroup(Test6VO vo) {
		test7Dao.deleteNoinGroup(vo);
		test7Dao.deleteNoinGroupReplyAs(vo);
	}
	
	
	@Override
	public void deleteNoinGroupReply(Test6VO vo) {
		test7Dao.deleteNoinGroupReply(vo);
	}
	
	
	@Override
	public int getTest7RegCheckAjax(int ysmNo) {
		return test7Dao.getTest7RegCheckAjax(ysmNo);
	}
	
	
	@Override
	public int getFindYunaTotCnt(yunaInfoVO vo) {
		return test7Dao.getFindYunaTotCnt(vo);
	}
	
	
	@Override
	public int getAddRequestTotCnt(Test6VO vo) {
		return test7Dao.getAddRequestTotCnt(vo);
	}
	
	
	@Override
	public EgovMap getNoinGroupDtl(int num) {
		return test7Dao.getNoinGroupDtl(num);
	}
	
	
	@Override
	public EgovMap getNoinGroupReplyDtl(int num) {
		return test7Dao.getNoinGroupReplyDtl(num);
	}
	
	
	@Override
	public EgovMap getAddRequestDetail(Test7VO vo) {
		return test7Dao.getAddRequestDetail(vo);
	}
	
	
	
}








