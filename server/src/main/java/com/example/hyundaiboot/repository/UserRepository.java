package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository  extends JpaRepository<User, String> {
	Optional<User> findById(String id);
	List<User> findByName(String name);
}
