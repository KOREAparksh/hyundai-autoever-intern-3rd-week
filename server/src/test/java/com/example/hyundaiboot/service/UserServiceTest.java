package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserServiceTest {

	@Autowired
	private UserService userService;

	@Test
	void testAllUser(){
		User user = userService.getAllUser().get(0);
		System.out.println(user.getUserDeviceList());
	}
}
