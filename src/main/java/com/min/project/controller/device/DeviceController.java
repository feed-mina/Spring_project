package com.min.project.controller.device;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.min.project.device.DeviceService;
import com.min.project.device.DeviceVO;

@Controller
public class DeviceController {
	 @Resource(name = "DeviceService")
		private DeviceService DeviceService;
		
		//목록 페이지
		@RequestMapping(value="/project/DeviceActive.do")
		public String DeviceActive(
				@ModelAttribute("DeviceVO") DeviceVO DeviceVO,
				HttpServletRequest request,
				HttpServletResponse response,
				ModelMap model,
				HttpSession httpSession)
			throws Exception{
			
			httpSession.setAttribute("sessionMenuCd", "9001");
			DeviceVO.setSessionMemberId((String)httpSession.getAttribute("sessionMemberId"));
			
			//총 갯수
			int DeviceTot = DeviceService.DeviceTot(DeviceVO);
			DeviceVO.setRowTotal(DeviceTot);

			// 목록
			List<?> deviceList = DeviceService.DeviceList(DeviceVO);
			model.addAttribute("deviceList", deviceList);
			
			return "/project/DevicePage";
		}
}
