package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.DeviceMaster;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DeviceMasterRepository extends JpaRepository<DeviceMaster, String> {
	Optional<DeviceMaster> findById(String id);
}
