package egovframework.mobile.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.mobile.mypage.service.MobileMypageService;
import egovframework.mobile.mypage.service.MypageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mobileMypageService")
public class MobileMypageServiceImpl extends EgovAbstractServiceImpl implements MobileMypageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobileMypageServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobileMypageMapper")
	private MobileMypageMapper mobileMypageMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 마이페이지 최근상담내역
	public EgovMap getMypageRecCns(MypageVO vo) {
		return mobileMypageMapper.getMypageRecCns(vo);
	}
	
	// 상담이력 목록
	public List<EgovMap> getMypageCnsHisList(MypageVO vo) {
		return mobileMypageMapper.getMypageCnsHisList(vo);
	}
	
	// 마이페이지 상세보기
	public EgovMap getMypageRecCnsDtl(MypageVO vo) {
		return mobileMypageMapper.getMypageRecCnsDtl(vo);
	}
	
}