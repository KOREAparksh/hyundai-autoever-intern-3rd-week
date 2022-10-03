package com.example.hyundaiboot.service;

import com.example.hyundaiboot.dto.FavoriteDto;
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

	@Test
	public void testPostFavoriteScreen() throws NoSuchFieldException {

		userFavoriteScreenService.postFavoriteScreen("seunpark", "3");
	}

	@Test
	public void testPostFavoriteScreenErrorByAlreadyRegisted() throws NoSuchFieldException {
		Assertions.assertThrows(NoSuchFieldException.class, () -> {
			userFavoriteScreenService.postFavoriteScreen("seunpark", "1");
		});
	}

	@Test
	public void testDeleteFavoriteScreen() throws NoSuchFieldException {
		userFavoriteScreenService.deleteFavoriteScreen("seunpark", "3");
	}

	@Test
	public void testDeleteFavoriteScreenError() throws NoSuchFieldException {
		Assertions.assertThrows(NoSuchFieldException.class, () -> {
			userFavoriteScreenService.deleteFavoriteScreen("seunpark", "1");
		});
	}
}
