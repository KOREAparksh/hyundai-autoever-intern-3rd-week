package com.example.hyundaiboot.repository;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ScreenDefineRepositoryTest {

	@Autowired
	private ScreenDefineRepository screenDefineRepository;

	@Test
	void  testGetAllScreenDefine(){
		screenDefineRepository.findAll().forEach(System.out::println);
	}


	@Test
	void  testGetByIdScreenDefine() {
//		Assertions.assertThrows(NoSuchFieldException.class, () -> {
//			screenDefineRepository.findByScreenId("123") .orElseThrow(()->new NoSuchFieldException());
//		});
	}

}
