package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.PushMessageGroup;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserMessageGroup;
import com.example.hyundaiboot.domain.UserMessageGroupId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserMessageGroupRepository extends JpaRepository<UserMessageGroup, UserMessageGroupId> {
	Optional<UserMessageGroup> findByUserAndPushMessageGroup(User user, PushMessageGroup pushMessageGroup);
	Optional<UserMessageGroup> findByUserIdAndPushMessageGroupId(String userId, String pushMessageGroupId);
	void deleteAllByUserId(String userId);
}
