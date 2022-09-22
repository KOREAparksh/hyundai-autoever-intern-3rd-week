package com.example.hyundaiboot.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMessageGroupServiceTest {
	@Autowired
	private UserMessageGroupService userMessageGroupService;

	@Test
	void testGetPushGroup() throws NoSuchFieldException {
		System.out.println(userMessageGroupService.getPushGroup("1"));
	}
}
