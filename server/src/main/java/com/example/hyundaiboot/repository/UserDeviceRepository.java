package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import java.util.List;

public interface UserDeviceRepository extends JpaRepository<UserDevice, User> {
	List<UserDevice> findByUserId(String id);
}
