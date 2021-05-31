package ggsc.test8.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test8.service.Test8VO;

public interface Test8Service {
	
	// 목록
	List<EgovMap> getTest8StateList(Test8VO vo);

	List<EgovMap> getYumiStateList(Test8VO vo);
	
	List<EgovMap> getAppleStateList(Test8VO vo);
	
	List<EgovMap> getYsmStateList(Test8VO vo);
	
	List<EgovMap> getRandomStateList(Test8VO vo);
	
}