package com.min.project.device.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.stereotype.Repository;

import com.min.project.cmm.AbstractDAO;
import com.min.project.device.DeviceVO;

@Repository
public class DeviceDAO extends AbstractDAO {

	// sqlsession이 바로 MyBatis 컨테이너이다. 마이바티스 컨테이너 생성
	private SqlSession mybatis;
	/**
	public DeviceDAO() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	*/
	
	// 메인스페이스.id 를 적절하게 사용한다. 파라미터 객체로 DeviceDAO객체를 전달해야 insertDevice로 설정한 사용자 sql값을 맵핑할 수 있다.
	public void insertDevice(DeviceVO vo) {
		mybatis.insert("DeviceDAO.insertDevice",  vo);
	}
	public void updateDevice(DeviceVO vo) {
		mybatis.update("DeviceDAO.updateDevice",  vo);
	}

	public void deleteDevice(DeviceVO vo) {
		mybatis.delete("DeviceDAO.deleteDevice",  vo);
	}
/**
	public void getDevice(DeviceVO vo) {
		return mybatis.selectOne("DeviceDAO.getDevice", vo);
	}

	public void getDeviceList(DeviceVO vo) {
		return mybatis.selectList("DeviceDAO.getDeviceList",  vo);
	}
 * @return 
*/
	public DeviceDAO getDevice(DeviceVO vo) {
		return mybatis.selectOne("DeviceDAO.getDevice", vo);
	}

	public List<DeviceDAO> getDeviceList(DeviceVO vo) {
		return mybatis.selectList("DeviceDAO.getDeviceList",  vo);
	}
	
	
	 // 총갯수
	 
	 public int DeviceTot(DeviceVO vo){
		return (Integer)getSqlMapClientTemplate().queryForObject("DeviceDAO.DeviceTot", vo);
		}
		
	// 목록

	public List<?> DeviceList(DeviceVO vo) throws Exception{
	return list("DeviceDAO.DeviceList", vo);
	}

}
