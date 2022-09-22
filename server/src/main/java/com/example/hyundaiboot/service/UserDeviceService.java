package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.dto.DeviceDto;
import com.example.hyundaiboot.repository.UserDeviceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class UserDeviceService {
	@Autowired
	private UserDeviceRepository userDeviceRepository;

	@Transactional
	public List<DeviceDto> getAllDevice(){
		List<UserDevice> list = userDeviceRepository.findAll();
		List<DeviceDto> result = new ArrayList<>();
		for(UserDevice device : list){
			DeviceDto deviceDto = new DeviceDto();
			deviceDto.setUserId(device.getUser().getId());
			deviceDto.setDeviceDescription(device.getDescription());
			deviceDto.setDeviceId(device.getDeviceMaster().getId());
			deviceDto.setDeviceKind(device.getDeviceMaster().getKind());
			deviceDto.setMaxSentCount(device.getMax_sent_count());
			deviceDto.setIsUsed(device.getUseState());
			result.add(deviceDto);
		}
		return result;
	}

	@Transactional
	public List<UserDevice> getDevices(String userid){
		return userDeviceRepository.findByUserId(userid);
	}
}
