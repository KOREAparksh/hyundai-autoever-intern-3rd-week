package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.repository.UserDeviceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class UserDeviceService {
	@Autowired
	private UserDeviceRepository userDeviceRepository;

	@Transactional
	public List<UserDevice> getAllDevice(){
		return userDeviceRepository.findAll();
	}

	@Transactional
	public List<UserDevice> getDevices(String userid){
		return userDeviceRepository.findByUserId(userid);
	}
}
