package egovframework.mobile.psyCns.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.mobile.psyCns.service.MobilePsyCnsService;
import egovframework.mobile.psyCns.service.PsyCnsDocVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mobilePsyCnsService")
public class MobilePsyCnsServiceImpl extends EgovAbstractServiceImpl implements MobilePsyCnsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobilePsyCnsServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobilePsyCnsMapper")
	private MobilePsyCnsMapper mobilePsyCnsMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// DUKE-AD 등록 ajax
	public void insertPsyDukeDoc(PsyCnsDocVO vo) {
		mobilePsyCnsMapper.insertPsyDukeDoc(vo);
	}
	
	// GDS-SI 등록 ajax
	public void insertPsyGdsDoc(PsyCnsDocVO vo) {
		mobilePsyCnsMapper.insertPsyGdsDoc(vo);
	}
	
	// 불안척도 등록 ajax
	public void insertPsyAnxiDoc(PsyCnsDocVO vo) {
		mobilePsyCnsMapper.insertPsyAnxiDoc(vo);
	}
	
	// 대인관계변화척도 등록 ajax
	public void insertPsyPerRelDoc(PsyCnsDocVO vo) {
		mobilePsyCnsMapper.insertPsyPerRelDoc(vo);
	}
	
	// 사별스트레스척도 등록 ajax
	public void insertPsyBereavDoc(PsyCnsDocVO vo) {
		mobilePsyCnsMapper.insertPsyBereavDoc(vo);
	}
	
}