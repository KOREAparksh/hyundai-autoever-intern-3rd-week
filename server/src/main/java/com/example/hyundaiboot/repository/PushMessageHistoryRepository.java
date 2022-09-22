package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.*;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PushMessageHistoryRepository  extends JpaRepository<PushMessageHistory, PushMessageHistoryId> {
}
