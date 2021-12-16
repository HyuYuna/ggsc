package egovframework.mobile.main.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.mobile.main.service.LoginVO;
import egovframework.mobile.main.service.MobileMainService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mobileMainService")
public class MobileMainServiceImpl extends EgovAbstractServiceImpl implements MobileMainService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobileMainServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobileMainMapper")
	private MobileMainMapper mobileMainMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	
	// 로그인 정보
	public EgovMap actionLogin(LoginVO vo) throws Exception {
    	
    	// 1. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
		/*LoginVO loginVO = mobileMainMapper.actionLogin(vo);
    	return loginVO;*/
		
		return mobileMainMapper.actionLogin(vo);
    }
	// 회원 ID 찾기
	public EgovMap findUserId(LoginVO vo) throws Exception {
		return mobileMainMapper.findUserId(vo);
	}
	
	// 회원 PW 찾기
	public int findPw(LoginVO vo) throws Exception {
		return mobileMainMapper.findPw(vo);
	}
	
	// PW 재설정
	public void userPwReset(LoginVO vo) {
		mobileMainMapper.userPwReset(vo);
	}
	
}
