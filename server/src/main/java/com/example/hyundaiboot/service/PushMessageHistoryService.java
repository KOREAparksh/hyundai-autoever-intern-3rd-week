package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.repository.PushMessageHistoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class PushMessageHistoryService {
	@Autowired
	private final PushMessageHistoryRepository pushMessageHistoryRepository;

	@Transactional
	public List<PushMessageHistory> getAllPushMessageHistory(){
		return pushMessageHistoryRepository.findAll();
	}

	@Transactional
	public List<PushMessageHistory> getPushMessageHistoryByUserid(String userid){
		List<PushMessageHistory> list =  pushMessageHistoryRepository.findAll();
		List<PushMessageHistory> result = new ArrayList<>();

		User user = new User();

		for(PushMessageHistory e : list){
			if (userid.compareTo(e.getUser()) == 0){
				result.add(e);
			}
		}
		return result;
	}

}
