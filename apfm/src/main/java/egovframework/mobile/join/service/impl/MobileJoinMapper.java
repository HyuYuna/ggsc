package egovframework.mobile.join.service.impl;

import java.util.List;

import egovframework.mobile.join.service.CenterVO;
import egovframework.mobile.join.service.CommonVO;
import egovframework.mobile.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mobileJoinMapper")
public interface MobileJoinMapper {
	
	// 회원가입 등록
	void insertJoinReg(JoinVO vo);
	
	// 아이디 중복확인
	int getIdCheck(String userId);
	
	List<EgovMap> getGroupMngDtlMList(CommonVO param);
	// 공통값 목록
			
	// 센터 목록
	List<EgovMap> getCenterManageList(CenterVO centerVO);
}
