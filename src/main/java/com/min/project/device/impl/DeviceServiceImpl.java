package com.min.project.device.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.min.project.device.DeviceService;
import com.min.project.device.DeviceVO;

@Service("DeviceService")
public class DeviceServiceImpl implements DeviceService {
	 @Resource(name="DeviceDAO")
	    private DeviceDAO DeviceDAO;
	 
	    //총 갯수
	    public int DeviceTot(DeviceVO vo) {    	
			return DeviceDAO.DeviceTot(vo);
		}
	    
		//목록
		public List<?> DeviceList(DeviceVO vo) throws Exception {
			List<?> resultList = DeviceDAO.DeviceList(vo);    	
			return resultList;
		}
}
