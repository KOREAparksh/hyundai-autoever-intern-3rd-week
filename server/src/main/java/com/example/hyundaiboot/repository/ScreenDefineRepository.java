package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.ScreenDefine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ScreenDefineRepository extends JpaRepository<ScreenDefine, String> {
	Optional<ScreenDefine> findByScreenId(String screenUrl);
	Optional<ScreenDefine> findByUrl(String screenUrl);
}
