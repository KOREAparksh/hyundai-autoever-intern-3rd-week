package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMessageGroupRepositoryTest {

	@Autowired
	private UserMessageGroupRepository userMessageGroupRepository;

	@Test
	void testGetAllWithId(){
//		System.out.println(userMessageGroupRepository.findByUserIdAndPushMessageGroupId("1", "1"));
//		System.out.println(userMessageGroupRepository.findByUserIdAndPushMessageGroupId("1", "2"));
	}
}
