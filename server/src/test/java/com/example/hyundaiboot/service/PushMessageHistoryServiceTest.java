package com.example.hyundaiboot.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PushMessageHistoryServiceTest {

	@Autowired
	private PushMessageHistoryService pushMessageHistoryService;

	@Test
	void testGetPushMessageHistory(){
		pushMessageHistoryService.getPushMessageHistory().forEach(System.out::println);
	}

}
