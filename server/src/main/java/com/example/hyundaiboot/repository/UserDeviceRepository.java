package com.example.hyundaiboot.repository;

import com.example.hyundaiboot.domain.DeviceMaster;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.domain.UserDeviceId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDeviceRepository extends JpaRepository<UserDevice, UserDeviceId> {
	List<UserDevice> findByUserId(String id);
	UserDevice findByUserAndDeviceMaster(User user, DeviceMaster deviceMaster);
	void deleteByUserAndDeviceMaster(User user, DeviceMaster deviceMaster);
}
