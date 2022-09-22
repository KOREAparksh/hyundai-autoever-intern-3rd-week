package com.example.hyundaiboot.dto;


import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;
import org.springframework.boot.jackson.JsonComponent;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class DeviceDto {
	@JsonProperty("user_id")
	String userId;
	@JsonProperty("device_description")
	String deviceDescription;
	@JsonProperty("device_id")
	String deviceId;
	@JsonProperty("device_kind")
	String deviceKind;
	@JsonProperty("max_sent_count")
	int maxSentCount;
	@JsonProperty("is_used")
	String isUsed;
}
