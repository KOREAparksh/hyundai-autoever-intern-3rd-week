package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository  extends JpaRepository<User, String> {

}
