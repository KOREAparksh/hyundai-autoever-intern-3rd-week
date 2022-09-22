package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.PushMessageQueue;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PushMessageHistoryRepository  extends JpaRepository<PushMessageHistory, PushMessageQueue> {
}
