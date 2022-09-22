package com.example.hyundaiboot.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PushMessageMasterRepositoryTest {
	@Autowired
	private PushMessageMasterRepository pushMessageMasterRepository;

	@Test
	void getPushMessageMasterById(){
		System.out.println(pushMessageMasterRepository.findById(1L));
	}
}
