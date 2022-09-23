package com.example.hyundaiboot.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class PushGroupDto {
	@JsonProperty("push_group_id")
	String pushGroupId;
	@JsonProperty("push_group_name")
	String pushGroupName;
	@JsonProperty("is_check")
	boolean isCheck;
}
