package com.example.hyundaiboot.service;

import com.example.hyundaiboot.repository.UserFavoriteScreenRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserFavoriteScreenServiceTest {
	@Autowired
	private UserFavoriteScreenService userFavoriteScreenService;

	@Test
	public void testGetAllFavoriteScreenService() throws NoSuchFieldException {
		userFavoriteScreenService.getAllFavoriteScreen("seunpark").forEach(System.out::println);
	}
	@Test
	public void testGetAllFavoriteScreenServiceUserIdError() throws NoSuchFieldException {
		Assertions.assertThrows(NoSuchFieldException.class, () -> {
			userFavoriteScreenService.getAllFavoriteScreen("1111111");
		});
	}
}
