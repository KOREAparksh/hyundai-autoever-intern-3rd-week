package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.PushMessageGroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PushMessageGroupRepository extends JpaRepository<PushMessageGroup, String> {
	Optional<PushMessageGroup> findById(String id);
}
