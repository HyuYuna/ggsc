package egovframework.mobile.mypage.service.impl;

import java.util.List;

import egovframework.mobile.mypage.service.MypageVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mobileMypageMapper")
public interface MobileMypageMapper {

	// 마이페이지 최근상담내역
	EgovMap getMypageRecCns(MypageVO vo);
	
	// 상담이력 목록
	List<EgovMap> getMypageCnsHisList(MypageVO vo);
	
	// 마이페이지 상세보기
	EgovMap getMypageRecCnsDtl(MypageVO vo); 
}
