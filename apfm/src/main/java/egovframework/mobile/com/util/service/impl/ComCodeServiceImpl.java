package egovframework.mobile.com.util.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.mobile.com.util.service.ComCodeService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("comCodeService")
public class ComCodeServiceImpl extends EgovAbstractServiceImpl implements ComCodeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ComCodeServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "comCodeMapper")
	private ComCodeMapper comCodeMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 상담신청구분
	@Override
	public List<?> selectCnsReqList() throws Exception {
		return comCodeMapper.selectCnsReqList();
	}
	// 센터구분
	@Override
	public List<?> selectCenterGbList() throws Exception {
		return comCodeMapper.selectCenterGbList();
	}
	// 권역구분
	@Override
	public List<?> selectZoneGbList() throws Exception {
		return comCodeMapper.selectZoneGbList();
	}
	// 상담구분
	@Override
	public List<?> selectCnsGbList() throws Exception {
		return comCodeMapper.selectCnsGbList();
	}
	
	// 학력
	@Override
	public List<?> selectEduList() throws Exception {
		return comCodeMapper.selectEduList();
	}
	// 주거형태
	@Override
	public List<?> selectLivgList(){
		return comCodeMapper.selectLivgList();
	}
	// 주택형태
	@Override
	public List<?> selectHouseList() throws Exception {
		return comCodeMapper.selectHouseList();
	}
	// 동거형태
	@Override
	public List<?> selectLiveList() throws Exception {
		return comCodeMapper.selectLiveList();
	}
	// 상담자구분
	@Override
	public List<?> selectCnsrGbList() throws Exception {
		return comCodeMapper.selectCnsrGbList();
	}
	// 상담경위
	@Override
	public List<?> selectCnsDtlList() throws Exception {
		return comCodeMapper.selectCnsDtlList();
	}
	// 노인과의 관계
	@Override
	public List<?> selectOlderRelList() throws Exception {
		return comCodeMapper.selectOlderRelList();
	}
	// 결혼상태
	@Override
	public List<?> selectMerrStatList() throws Exception {
		return comCodeMapper.selectMerrStatList();
	}
	// 주요문제
	@Override
	public List<?> selectMajorProbList() throws Exception {
		return comCodeMapper.selectMajorProbList();
	}
	// 상담진행상태
	@Override
	public List<?> selectCnsStatList() throws Exception {
		return comCodeMapper.selectCnsStatList();
	}
	// 지역구분
	@Override
	public List<?> selectLocalGbList() throws Exception {
		return comCodeMapper.selectLocalGbList();
	}
	// 주호소문제
	@Override
	public List<?> selectMajorApplList() throws Exception {
		return comCodeMapper.selectMajorApplList();
	}
	
}