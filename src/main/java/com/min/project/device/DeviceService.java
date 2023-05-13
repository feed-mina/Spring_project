package com.min.project.device;

import java.util.List;

public interface DeviceService {
	//총 갯수
    int DeviceTot(DeviceVO vo);
    
	//목록
	public List<?> DeviceList(DeviceVO vo) throws Exception;
}