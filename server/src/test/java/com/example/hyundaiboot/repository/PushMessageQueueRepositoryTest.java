package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.PushMessageQueue;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PushMessageQueueRepositoryTest {

	@Autowired
	private PushMessageQueueRepository pushMessageQueueRepository;

	@Test
	void testGetAllPushMessageQueue(){
		pushMessageQueueRepository.findAll().forEach(System.out::println);

		List<PushMessageQueue> list = pushMessageQueueRepository.findAll();
		System.out.println(list.get(0).getUserDevice().getDescription());
		System.out.println(list.get(1).getUserDevice().getDescription());
//		System.out.println(list.get(2).getUserDevice().getDescription());
	}
}
