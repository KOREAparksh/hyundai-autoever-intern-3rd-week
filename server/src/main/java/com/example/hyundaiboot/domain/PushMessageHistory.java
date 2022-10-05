package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@IdClass(PushMessageHistoryId.class)
@Table(name = "PUSH_MSG_SENT_HI")
public class PushMessageHistory {
	@Id
	@Column(name = "PUSH_GEN_DT")
	private LocalDateTime generateTime;

	@Id
	@Column(name = "USER_ID")
	private String user;

	@Id
	@Column(name = "DEVICE_ID")
	private String userDevice;

	@Id
	@Column(name = "PUSH_MSG_ID")
	private long pushMessageMaster;

	@Column(name = "SENT_STAT")
	private String sentState;

	@Column(name = "SENT_DT")
	private LocalDateTime sentDateTime;

}
