package com.example.hyundaiboot.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class PushHistoryDto {
	String userId;
	String userName;
	String deviceId;
	String deviceDescription;
	String pushTitle;
	String pushContent;
	LocalDateTime pushDateTime;
	String sentState;
	LocalDateTime sentDateTime;
}
