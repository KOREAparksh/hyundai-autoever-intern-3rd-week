package com.example.hyundaiboot.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PushMessageQueueRepositoryTest {

	@Autowired
	private PushMessageQueueRepository pushMessageQueueRepository;

	@Test
	void testGetAllPushMessageQueue(){
		pushMessageQueueRepository.findAll().forEach(System.out::println);
	}
}
