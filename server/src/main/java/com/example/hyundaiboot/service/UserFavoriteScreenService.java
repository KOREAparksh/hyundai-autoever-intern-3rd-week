package com.example.hyundaiboot.service;


import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserFavoriteScreen;
import com.example.hyundaiboot.dto.FavoriteDto;
import com.example.hyundaiboot.repository.UserFavoriteScreenRepository;
import com.example.hyundaiboot.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class UserFavoriteScreenService {

	@Autowired
	private UserFavoriteScreenRepository userFavoriteScreenRepository;
	@Autowired
	private UserRepository userRepository;

	@Transactional
	public List<FavoriteDto> getAllFavoriteScreen(String userId) throws NoSuchFieldException {
		User user = userRepository.findById(userId).orElseThrow(()->new NoSuchFieldException("없는 유저입니다."));
		List<UserFavoriteScreen> list = userFavoriteScreenRepository.findByUser(user);
		List<FavoriteDto> result = new ArrayList<>();

		for(UserFavoriteScreen ufs : list){
			FavoriteDto temp = new FavoriteDto();
			temp.setScreenId(ufs.getScreenDefine().getScreenId());
			temp.setScreenUrl(ufs.getScreenDefine().getUrl());
			result.add(temp);
		}
		return result;
	}
}
