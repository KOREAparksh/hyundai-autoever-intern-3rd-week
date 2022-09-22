package com.example.hyundaiboot.controller;

import com.example.hyundaiboot.dto.DeviceDto;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	void getPushHistory() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/push-message-history"))
				.andDo(print())
				.andExpect(status().isOk());

	}
}
