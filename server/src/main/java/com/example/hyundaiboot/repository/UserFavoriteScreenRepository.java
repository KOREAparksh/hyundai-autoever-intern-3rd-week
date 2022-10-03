package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserFavoriteScreen;
import com.example.hyundaiboot.domain.UserFavoriteScreenId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserFavoriteScreenRepository extends JpaRepository<UserFavoriteScreen, UserFavoriteScreenId> {
	List<UserFavoriteScreen> findByUser(User user);
}
