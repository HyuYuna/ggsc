package egovframework.mobile.crLibrary.service.impl;

import java.util.List;

import egovframework.mobile.crLibrary.service.CrLibraryVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mobileCareLibraryMapper")
public interface MobileCareLibraryMapper {
	
	// 마음돌봄 자료실  목록
	List<EgovMap> getCrLibraryList(CrLibraryVO vo);
	
	// 마음돌봄 자료실 등록
	void insertCareLibraryReg(CrLibraryVO vo);

	// 마음돌봄 자료실 상세보기
	EgovMap getCareLibraryDtl(CrLibraryVO vo);
	
	// 마음돌봄 자료실 총갯수
	int getCareLibraryTotal();
	
	// 마음돌봄 자료실 파일업로드
	void insertCareLibraryFileUpload(CrLibraryVO vo);
	
}
