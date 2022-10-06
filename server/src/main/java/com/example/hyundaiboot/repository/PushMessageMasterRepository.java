package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.PushMessageMaster;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface PushMessageMasterRepository extends JpaRepository<PushMessageMaster, Long> {
	List<PushMessageMaster> findAll();
	Optional<PushMessageMaster> findById(Long id);
}
