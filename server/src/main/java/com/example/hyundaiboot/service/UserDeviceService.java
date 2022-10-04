package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.DeviceMaster;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.dto.DeviceDto;
import com.example.hyundaiboot.repository.DeviceMasterRepository;
import com.example.hyundaiboot.repository.UserDeviceRepository;
import com.example.hyundaiboot.repository.UserRepository;
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
	private UserRepository userRepository;
	@Autowired
	private DeviceMasterRepository deviceMasterRepository;
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
			deviceDto.setMaxSentCount(device.getMaxSentCount());
			deviceDto.setIsUsed(device.getUseState());
			result.add(deviceDto);
		}
		return result;
	}

	@Transactional
	public List<UserDevice> getDevices(String userid){
		return userDeviceRepository.findByUserId(userid);
	}

	@Transactional
	public void postDevice(DeviceDto deviceDto) throws NoSuchFieldException {
		// 유저는 있어야 하고 DeviceId는 없어야 정상.
		// 유저가 없다 -> 계정 만들고 와야 함.
		// 유저가 있는데 이미 DeviceId가 있다 -> 중복
		//1. 사용자 확인
		if (userRepository.findById(deviceDto.getUserId()).isEmpty())
			throw new NoSuchFieldException("없는 사용자입니다.");
		User user = userRepository.findById(deviceDto.getUserId()).get();
		//2. 디바이스id 중복 확인
		if (deviceMasterRepository.findById(deviceDto.getDeviceId()).isPresent())
			throw new NoSuchFieldException("UserId와 DeviceID가 중복된 값입니다.");

		//3. entity로 옮기기
		DeviceMaster deviceMaster = new DeviceMaster();
		deviceMaster.setId(deviceDto.getDeviceId());
		deviceMaster.setKind(deviceDto.getDeviceKind());
		deviceMasterRepository.save(deviceMaster);

		UserDevice userDevice = new UserDevice();
		userDevice.setUser(user);
		userDevice.setDeviceMaster(deviceMaster);
		userDevice.setMaxSentCount(deviceDto.getMaxSentCount());
		userDevice.setDescription(deviceDto.getDeviceDescription());
		userDevice.setUseState(deviceDto.getIsUsed());
		userDeviceRepository.save(userDevice);

		System.out.println(deviceMaster);
		System.out.println(userDevice);
	}


	@Transactional
	public void updateDevice(DeviceDto deviceDto) throws Exception {
		if (userRepository.findById(deviceDto.getUserId()).isEmpty())
			throw new NoSuchFieldException("없는 사용자입니다.");
		User user = userRepository.findById(deviceDto.getUserId()).get();

		if (deviceMasterRepository.findById(deviceDto.getDeviceId()).isEmpty())
			throw new NoSuchFieldException("없는 기기입니다.");
		DeviceMaster deviceMaster = new DeviceMaster();
		deviceMaster.setId(deviceDto.getDeviceId());
		deviceMaster.setKind(deviceDto.getDeviceKind());
		deviceMasterRepository.save(deviceMaster);

		UserDevice userDevice = new UserDevice();
		userDevice.setUser(user);
		userDevice.setDeviceMaster(deviceMaster);
		userDevice.setMaxSentCount(deviceDto.getMaxSentCount());
		userDevice.setDescription(deviceDto.getDeviceDescription());
		userDevice.setUseState(deviceDto.getIsUsed());
		userDeviceRepository.save(userDevice);
	}

	@Transactional
	public void deleteDevice(String userId, String deviceId) throws Exception {
		if (userRepository.findById(userId).isEmpty())
			throw new NoSuchFieldException("없는 사용자입니다.");
		User user = userRepository.findById(userId).get();

		if (deviceMasterRepository.findById(deviceId).isEmpty())
			throw new NoSuchFieldException("없는 기기입니다.");
		DeviceMaster deviceMaster = deviceMasterRepository.findById(deviceId).get();

		UserDevice userDevice = userDeviceRepository.findByUserAndDeviceMaster(user, deviceMaster);
		userDevice.setUseState("N");
		userDeviceRepository.save(userDevice);
	}

}
