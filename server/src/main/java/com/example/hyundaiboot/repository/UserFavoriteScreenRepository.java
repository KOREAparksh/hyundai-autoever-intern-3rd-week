package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.UserFavoriteScreen;
import com.example.hyundaiboot.domain.UserFavoriteScreenId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFavoriteScreenRepository extends JpaRepository<UserFavoriteScreen, UserFavoriteScreenId> {
}
