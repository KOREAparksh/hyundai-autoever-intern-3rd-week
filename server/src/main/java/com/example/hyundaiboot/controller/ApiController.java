package com.example.hyundaiboot.controller;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.PushMessageQueue;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.dto.DeviceDto;
import com.example.hyundaiboot.dto.PushHistoryDto;
import com.example.hyundaiboot.service.PushMessageHistoryService;
import com.example.hyundaiboot.service.PushMessageQueueService;
import com.example.hyundaiboot.service.UserDeviceService;
import com.example.hyundaiboot.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/")
public class ApiController {
	@Autowired
	private UserService userService;

	@Autowired
	private UserDeviceService userDeviceService;

	@Autowired
	private PushMessageHistoryService pushMessageHistoryService;


	@GetMapping("/txt")
	public String getTest(@RequestParam String str){
		return str;
	}

	@GetMapping("/user")
	public User getUser(@RequestParam String id){
		Optional<User> userOptional;
		User user;
		try {
			user  = userService.getUserById(id);
		}catch (Exception e){
			user = new User();
			user.setId( "ttt");
			user.setName("test");
			user.setPw("123");
			user.setColor("blue");
			user.setFont("맑은");
			user.setLang("2");
		}
		return user;
	}

	@GetMapping("/devices")
	public List<DeviceDto> getAllDevices(){
		return userDeviceService.getAllDevice();
	}

	@PostMapping("/devices")
	public ResponseEntity postDevices(@RequestBody DeviceDto deviceDto){
		try {
			userDeviceService.postDevice(deviceDto);
			return ResponseEntity.ok().build();
		} catch (NoSuchFieldException e){
			System.out.println("11" + e.getMessage());
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
			System.out.println("22" + e.getMessage());
		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	@GetMapping("/push-message-history")
	public List<PushHistoryDto> getPushMessageHistory(){
		return pushMessageHistoryService.getPushMessageHistory();
	}
}
