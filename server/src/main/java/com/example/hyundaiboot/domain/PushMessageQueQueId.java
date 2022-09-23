package com.example.hyundaiboot.domain;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
public class PushMessageQueQueId implements Serializable {
	private LocalDateTime generateTime;
	private  UserDeviceId userDevice;
	private long pushMessageMaster;
}
