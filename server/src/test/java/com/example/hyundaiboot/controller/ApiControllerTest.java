package com.example.hyundaiboot.controller;

import com.example.hyundaiboot.dto.DeviceDto;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

//@WebMvcTest
@SpringBootTest
@AutoConfigureMockMvc
class ApiControllerTest {
	@Autowired
	private MockMvc mockMvc;

	@Test
	void testGetUser() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.get("/user?id=1"))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void testGetAllDevices() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/devices"))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void testPostDevices() throws Exception {
		DeviceDto deviceDto = new DeviceDto();
		deviceDto.setUserId("1");
		deviceDto.setDeviceDescription("testtest");
		deviceDto.setDeviceId("3");
		deviceDto.setDeviceKind("test macbook");
		deviceDto.setMaxSentCount(3);
		deviceDto.setIsUsed("Y");

		ObjectMapper mapper = new ObjectMapper();
		String content = mapper.writeValueAsString(deviceDto);

		System.out.println(content);
		mockMvc.perform(MockMvcRequestBuilders.post("/devices")
				.content(content)
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void testPostDevicesErrorBySameDeviceId() throws Exception {
		DeviceDto deviceDto = new DeviceDto();
		deviceDto.setUserId("1");
		deviceDto.setDeviceDescription("testtest");
		deviceDto.setDeviceId("2");
		deviceDto.setDeviceKind("test macbook");
		deviceDto.setMaxSentCount(3);
		deviceDto.setIsUsed("Y");

		ObjectMapper mapper = new ObjectMapper();
		String content = mapper.writeValueAsString(deviceDto);

		System.out.println(content);
		mockMvc.perform(MockMvcRequestBuilders.post("/devices")
						.content(content)
						.contentType(MediaType.APPLICATION_JSON)
						.accept(MediaType.APPLICATION_JSON))
				.andDo(print())
				.andExpect(status().is4xxClientError());
	}

	@Test
	void testUpdateDevices() throws Exception {
		DeviceDto deviceDto = new DeviceDto();
		deviceDto.setUserId("seunpark");
		deviceDto.setDeviceDescription("testtest123");
		deviceDto.setDeviceId("device1");
		deviceDto.setDeviceKind("test macbook123");
		deviceDto.setMaxSentCount(3);
		deviceDto.setIsUsed("Y");

		ObjectMapper mapper = new ObjectMapper();
		String content = mapper.writeValueAsString(deviceDto);

		System.out.println(content);
		mockMvc.perform(MockMvcRequestBuilders.put("/devices")
						.content(content)
						.contentType(MediaType.APPLICATION_JSON)
						.accept(MediaType.APPLICATION_JSON))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void testDeleteDevice() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.delete("/devices?user_id=1&device_id=3"))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void testDeleteDeviceErrorByDeviceId() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.delete("/devices?user_id=1&device_id=4"))
				.andDo(print())
				.andExpect(status().is4xxClientError());
	}

	@Test
	void getPushHistory() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/push-message-histories"))
				.andDo(print())
				.andExpect(status().isOk());

	}

	@Test
	void getPushGroup() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/push-groups?user_id=1"))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void getPushGroupErrorById() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/push-groups?user_id=100"))
				.andDo(print())
				.andExpect(status().is4xxClientError());
	}

	@Test
	void putPushGroup() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.put("/push-groups?user_id=1&group_id_list=2,3"))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void getFavoriteScreen() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/favorite?user_id=seunpark"))
				.andDo(print())
				.andExpect(status().isOk());

	}

	@Test
	void getFavoriteScreenError() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/favorite?user_id=abab"))
				.andDo(print())
				.andExpect(status().is4xxClientError());
	}

	@Test
	void postFavoriteScreen() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/favorite?user_id=seunpark&screen_id=3"))
				.andDo(print())
				.andExpect(status().isOk());
	}

	@Test
	void deleteFavoriteScreen() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.delete("/favorite?user_id=seunpark&screen_id=3"))
				.andDo(print())
				.andExpect(status().isOk());
	}
}
