package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.PushMessageQueQueId;
import com.example.hyundaiboot.domain.PushMessageQueue;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PushMessageQueueRepository extends JpaRepository<PushMessageQueue, PushMessageQueQueId> {
}
