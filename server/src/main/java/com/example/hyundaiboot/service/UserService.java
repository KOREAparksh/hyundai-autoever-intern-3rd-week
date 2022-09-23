package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService {

	@Autowired
	private final UserRepository userRepository;

	@Transactional
	public List<User> getAllUser(){
		return userRepository.findAll();
	}

	@Transactional
	public User getUserById(String id) throws NoSuchFieldException {
		User user = userRepository.findById(id).orElseThrow(()->new NoSuchFieldException());
		return user;
	}
}
