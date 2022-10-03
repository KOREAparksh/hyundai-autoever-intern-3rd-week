package com.example.hyundaiboot.controller;

import com.example.hyundaiboot.domain.PushMessageHistory;
import com.example.hyundaiboot.domain.PushMessageQueue;
import com.example.hyundaiboot.domain.User;
import com.example.hyundaiboot.domain.UserDevice;
import com.example.hyundaiboot.dto.DeviceDto;
import com.example.hyundaiboot.dto.FavoriteDto;
import com.example.hyundaiboot.dto.PushGroupDto;
import com.example.hyundaiboot.dto.PushHistoryDto;
import com.example.hyundaiboot.service.*;
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
	@Autowired
	private UserMessageGroupService userMessageGroupService;
	@Autowired
	private UserFavoriteScreenService userFavoriteScreenService;


	@GetMapping("/txt")
	public String getTest(@RequestParam String str){
		return str;
	}

	@GetMapping("/user")
	public ResponseEntity<User> getUser(@RequestParam String id){
		try {
			User user  = userService.getUserById(id);
			return ResponseEntity.ok(user);
		}catch (NoSuchFieldException e){
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		return ResponseEntity.internalServerError().build();
		}
	}

	@GetMapping("/devices")
	public ResponseEntity<List<DeviceDto>> getAllDevices(){
		try {
			return ResponseEntity.ok(userDeviceService.getAllDevice());
		}catch (Exception e){
			return ResponseEntity.internalServerError().build();
		}
	}

	@PostMapping("/devices")
	public ResponseEntity postDevice(@RequestBody DeviceDto deviceDto){
		try {
			userDeviceService.postDevice(deviceDto);
			return ResponseEntity.ok().build();
		} catch (NoSuchFieldException e){
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	@DeleteMapping("/devices")
	public ResponseEntity deleteDevice(@RequestParam("user_id") String userId, @RequestParam("device_id") String deviceId){
		try{
			userDeviceService.deleteDevice(userId, deviceId);
			return ResponseEntity.ok().build();
		}catch (NoSuchFieldException e){
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	@GetMapping("/push-message-histories")
	public List<PushHistoryDto> getPushMessageHistory(){
		return pushMessageHistoryService.getPushMessageHistory();
	}

	@GetMapping("/push-groups")
	public ResponseEntity<List<PushGroupDto>>  getPushGroup(@RequestParam("user_id") String userId){
		try {
			List<PushGroupDto> list = userMessageGroupService.getPushGroup(userId);
			return ResponseEntity.ok(list);
		} catch (NoSuchFieldException e) {
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	@PutMapping("/push-groups")
	public ResponseEntity  putPushGroup(@RequestParam("user_id") String userId, @RequestParam("group_id_list") List<String> groupIdList){
		try {
			userMessageGroupService.updatePushMessageGroup(userId, groupIdList);
			return ResponseEntity.ok().build();
		} catch (NoSuchFieldException e) {
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	@GetMapping("/favorite")
	public ResponseEntity<List<FavoriteDto>> getFavoriteScreen(@RequestParam("user_id") String userId){
		try {
			List<FavoriteDto> list = userFavoriteScreenService.getAllFavoriteScreen(userId);
			return ResponseEntity.ok(list);
		}  catch (NoSuchFieldException e) {
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}
		return  ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	@PostMapping("/favorite")
	public ResponseEntity postFavoriteScreen(@RequestParam("user_id") String userId, @RequestParam("screen_id") String screenId){
		try {
			userFavoriteScreenService.postFavoriteScreen(userId, screenId);
			return ResponseEntity.ok().build();
		}  catch (NoSuchFieldException e) {
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}
		return  ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}


	@DeleteMapping("/favorite")
	public ResponseEntity deleteFavoriteScreen(@RequestParam("user_id") String userId, @RequestParam("screen_id") String screenId){
		try {
			userFavoriteScreenService.deleteFavoriteScreen(userId, screenId);
			return ResponseEntity.ok().build();
		}  catch (NoSuchFieldException e) {
			return ResponseEntity.badRequest().build();
		}catch (Exception e){
		}
		return  ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
}
