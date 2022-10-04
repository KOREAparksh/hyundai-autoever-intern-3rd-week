package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.PushMessageMaster;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.dto.PushHistoryDto;
import com.example.hyundaiboot.repository.PushMessageHistoryRepository;
import com.example.hyundaiboot.repository.PushMessageMasterRepository;
import com.example.hyundaiboot.repository.UserDeviceRepository;
import com.example.hyundaiboot.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class PushMessageHistoryService {
	@Autowired
	private final PushMessageHistoryRepository pushMessageHistoryRepository;
	@Autowired
	private final UserRepository userRepository;
	@Autowired
	private final UserDeviceRepository userDeviceRepository;
	@Autowired final PushMessageMasterRepository pushMessageMasterRepository;


	@Transactional
	public List<PushHistoryDto> getPushMessageHistory(){
		List<PushMessageHistory> list =  pushMessageHistoryRepository.findAll();
		List<PushHistoryDto> dtoList = new ArrayList<>();

		for(PushMessageHistory e : list){
			User user = userRepository.findById(e.getUser()).get();
			String deviceId = e.getUserDevice();
			String deviceDescription = "@@@";
			PushMessageMaster pushMessage = pushMessageMasterRepository.findById(e.getPushMessageMaster()).get();

			List<UserDevice> userDeviceList = userDeviceRepository.findByUserId(e.getUser());
			for(UserDevice device : userDeviceList){
				if (device.getDeviceMaster().getId() == deviceId){
					deviceDescription = device.getDescription();
					break;
				}
			}

			PushHistoryDto pushHistoryDto = new PushHistoryDto();
			pushHistoryDto.setUserId(user.getId());
			pushHistoryDto.setUserName(user.getName());
			pushHistoryDto.setDeviceId(deviceId);
			pushHistoryDto.setDeviceDescription(deviceDescription);
			pushHistoryDto.setPushTitle(pushMessage.getTitle());
			pushHistoryDto.setPushContent(pushMessage.getContent());
			pushHistoryDto.setPushDateTime(e.getGenerateTime());
			pushHistoryDto.setSentState(e.getSentState());
			pushHistoryDto.setSentDateTime(e.getSentDateTime());
			dtoList.add(pushHistoryDto);
		}

		return dtoList;
	}

}
