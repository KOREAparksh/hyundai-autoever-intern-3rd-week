package com.example.hyundaiboot.dto;


import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class DeviceDto {
	String userId;
	String deviceDescription;
	String deviceId;
	String deviceKind;
	int maxSentCount;
	String isUsed;
}
