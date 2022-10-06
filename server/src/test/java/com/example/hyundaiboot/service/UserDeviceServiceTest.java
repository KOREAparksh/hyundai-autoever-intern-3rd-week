package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.dto.DeviceDto;
import com.example.hyundaiboot.repository.DeviceMasterRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.nio.file.NoSuchFileException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserDeviceServiceTest {
	@Autowired
	private UserDeviceService userDeviceService;
	@Autowired
	private UserService userService;
	@Autowired
	private DeviceMasterRepository deviceMasterRepository;

	@Test
	void testGetAllDevices(){
		userDeviceService.getAllDevice().forEach(System.out::println);
	}

	@Test
	void testGetUserDeviceByUserId(){
		userDeviceService.getDevices("1").forEach(System.out::println);
	}

	@Test
	void testPostDevice() throws Exception{
//		DeviceDto deviceDto = new DeviceDto();
//		deviceDto.setUserId("1");
//		deviceDto.setDeviceDescription("testtest");
//		deviceDto.setDeviceId("3");
//		deviceDto.setDeviceKind("test macbook");
//		deviceDto.setMaxSentCount(3);
//		deviceDto.setIsUsed("Y");
//
//		userDeviceService.postDevice(deviceDto);
//
//		System.out.println("User=============");
//		System.out.println(userService.getAllUser());
//		System.out.println("UserDevice=============");
//		System.out.println(userDeviceService.getAllDevice());
//		System.out.println("Device=============");
//		System.out.println(deviceMasterRepository.findAll());
	}

	@Test
	void testUpdateDevice() throws Exception {

//		DeviceDto deviceDto = new DeviceDto();
//		deviceDto.setUserId("seunpark");
//		deviceDto.setDeviceDescription("testtest123123");
//		deviceDto.setDeviceId("device1");
//		deviceDto.setDeviceKind("test macbook 123123");
//		deviceDto.setMaxSentCount(2);
//		deviceDto.setIsUsed("Y");
//
//		userDeviceService.updateDevice(deviceDto);
	}

	@Test
	void testUpdateDeviceErrorByUserId() throws Exception {

		DeviceDto deviceDto = new DeviceDto();
//		deviceDto.setUserId("seunpark123123");
//		deviceDto.setDeviceDescription("testtest123123");
//		deviceDto.setDeviceId("device1");
//		deviceDto.setDeviceKind("test macbook 123123");
//		deviceDto.setMaxSentCount(2);
//		deviceDto.setIsUsed("Y");
//
//		userDeviceService.updateDevice(deviceDto);
	}

	@Test
	void testUpdateDeviceErrorByDeviceId() throws Exception {

//		DeviceDto deviceDto = new DeviceDto();
//		deviceDto.setUserId("seunpark");
//		deviceDto.setDeviceDescription("testtest123123");
//		deviceDto.setDeviceId("device100");
//		deviceDto.setDeviceKind("test macbook 123123");
//		deviceDto.setMaxSentCount(2);
//		deviceDto.setIsUsed("Y");
//
//		userDeviceService.updateDevice(deviceDto);
	}

	@Test
	void testPostDeviceErrorBySameDeviceId(){
//		DeviceDto deviceDto = new DeviceDto();
//		deviceDto.setUserId("1");
//		deviceDto.setDeviceDescription("testtest");
//		deviceDto.setDeviceId("2");
//		deviceDto.setDeviceKind("test macbook");
//		deviceDto.setMaxSentCount(3);
//		deviceDto.setIsUsed("Y");
//
//		Assertions.assertThrows(NoSuchFieldException.class, () -> {
//			userDeviceService.postDevice(deviceDto);
//		});
	}

	@Test
	void deleteDevice() throws Exception {
//		userDeviceService.deleteDevice("seunpark", "device2");
	}

}
