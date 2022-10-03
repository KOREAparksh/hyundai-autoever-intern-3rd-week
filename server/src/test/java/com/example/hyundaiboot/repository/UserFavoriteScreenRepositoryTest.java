package com.example.hyundaiboot.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserFavoriteScreenRepositoryTest {

	@Autowired
	private UserFavoriteScreenRepository userFavoriteScreenRepository;

	@Test
	void testFindAll(){
		userFavoriteScreenRepository.findAll().forEach(System.out::println);
	}

}
