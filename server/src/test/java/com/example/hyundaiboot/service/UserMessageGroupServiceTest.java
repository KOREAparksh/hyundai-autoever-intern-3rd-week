package com.example.hyundaiboot.service;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMessageGroupServiceTest {
	@Autowired
	private UserMessageGroupService userMessageGroupService;

	@Test
	void testGetPushGroup() throws NoSuchFieldException {
		System.out.println(userMessageGroupService.getPushGroup("1"));
	}

	@Test
	void testUpdatePush() throws NoSuchFieldException {
//		List<String> list = new ArrayList<>();
//		list.add("1");
//		list.add("3");
//		userMessageGroupService.updatePushMessageGroup("1", list);
	}
	@Test
	void testUpdatePushErrorByPushGroupId() throws NoSuchFieldException {
//		List<String> list = new ArrayList<>();
//		list.add("1");
//		list.add("30");
//
//		Assertions.assertThrows(NoSuchFieldException.class, () -> {
//			userMessageGroupService.updatePushMessageGroup("1", list);
//		});
	}
}
