package egovframework.mobile.join.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.mobile.join.service.CenterVO;
import egovframework.mobile.join.service.CommonVO;
import egovframework.mobile.join.service.JoinVO;
import egovframework.mobile.join.service.MobileJoinService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mobileJoinService")
public class MobileJoinServiceImpl extends EgovAbstractServiceImpl implements MobileJoinService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobileJoinServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobileJoinMapper")
	private MobileJoinMapper mobileJoinMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 회원가입 등록
	public void insertJoinReg(JoinVO vo) {
		mobileJoinMapper.insertJoinReg(vo);
	}
	
	// 아이디 중복확인
	public int getIdCheck(String userId) {
		return mobileJoinMapper.getIdCheck(userId);
	}
	
	// 공통값 목록
	public List<EgovMap> getGroupMngDtlMList(CommonVO param) {
		return mobileJoinMapper.getGroupMngDtlMList(param);
	}
		
	// 센터 목록
	public List<EgovMap> getCenterManageList(CenterVO centerVO) {
		return mobileJoinMapper.getCenterManageList(centerVO);
	}
	
}