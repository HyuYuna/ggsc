package egovframework.mobile.comfCns.service.impl;

import egovframework.mobile.comfCns.service.AddComfCnsVO;
import egovframework.mobile.comfCns.service.ComfCnsVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mobileComfCnsMapper")
public interface MobileComfCnsMapper {

	// 상담신청 등록
	void insertComfCnsReg(ComfCnsVO vo);
	
	// 상담신청 파일업로드
	void insertComfCnsFileUpload(ComfCnsVO vo);
	
	// 상담신청 등록(추가자료입력)
	void insertAddComfCnsReg(AddComfCnsVO vo);
}
