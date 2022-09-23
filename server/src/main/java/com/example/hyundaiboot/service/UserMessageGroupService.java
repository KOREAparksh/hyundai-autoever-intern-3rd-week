package com.example.hyundaiboot.service;

import com.example.hyundaiboot.domain.PushMessageGroup;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserMessageGroup;
import com.example.hyundaiboot.dto.PushGroupDto;
import com.example.hyundaiboot.repository.PushMessageGroupRepository;
import com.example.hyundaiboot.repository.UserMessageGroupRepository;
import com.example.hyundaiboot.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserMessageGroupService {
	@Autowired
	private final UserRepository userRepository;
	@Autowired
	private final UserMessageGroupRepository userMessageGroupRepository;
	@Autowired
	private final PushMessageGroupRepository pushMessageGroupRepository;

	@Transactional
	public List<PushGroupDto> getPushGroup(String userId) throws NoSuchFieldException {
		if (userRepository.findById(userId).isEmpty())
			throw new NoSuchFieldException("없는 사용자입니다.");
		User user = userRepository.findById(userId).get();

		List<PushMessageGroup> pushGroupList = pushMessageGroupRepository.findAll();
		List<PushGroupDto> result = new ArrayList<>();

		for(PushMessageGroup group : pushGroupList){
			if (group.getIsUsed() == "N") continue;

			PushGroupDto pushGroupDto = new PushGroupDto();
			pushGroupDto.setPushGroupId(group.getId());
			pushGroupDto.setPushGroupName(group.getName());
			pushGroupDto.setCheck(false);
			if (userMessageGroupRepository.findByUserAndPushMessageGroup(user, group).isPresent()){
				pushGroupDto.setCheck(true);
			}
			result.add(pushGroupDto);
		}

		return result;
	}

	@Transactional
	public void updatePushMessageGroup(String userId, List<String> groupList) throws NoSuchFieldException {
		User user = userRepository.findById(userId).orElseThrow(()->new NoSuchFieldException("없는 유저입니다."));
		List<PushMessageGroup> pushMessageGroupList = pushMessageGroupRepository.findAll();

		userMessageGroupRepository.deleteAllByUserId(userId);
		for(String pushMessageGroupId : groupList){
			PushMessageGroup pushMessageGroup = pushMessageGroupRepository
						.findById(pushMessageGroupId).orElseThrow(()->new NoSuchFieldException());
			userMessageGroupRepository.save(new UserMessageGroup(user, pushMessageGroup));
		}
	}
}
