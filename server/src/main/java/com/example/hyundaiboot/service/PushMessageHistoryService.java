package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.repository.PushMessageHistoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
