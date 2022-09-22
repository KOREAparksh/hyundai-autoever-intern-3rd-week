package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.PushMessageQueue;
import com.example.hyundaiboot.repository.PushMessageHistoryRepository;
import com.example.hyundaiboot.repository.PushMessageQueueRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class PushMessageQueueService {
	@Autowired
	private final PushMessageQueueRepository pushMessageQueueRepository;

	@Transactional
	public List<PushMessageQueue> getAllPushMessageQueue(){
		return pushMessageQueueRepository.findAll();
	}
}
