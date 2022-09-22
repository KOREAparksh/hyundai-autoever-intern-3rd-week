package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.UserDevice;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserDeviceServiceTest {
	@Autowired
	private UserDeviceService userDeviceService;

	@Test
	void testGetAllDevices(){
		userDeviceService.getAllDevice().forEach(System.out::println);
	}

	@Test
	void testGetUserDeviceByUserId(){
		userDeviceService.getDevices("1").forEach(System.out::println);
	}

}
