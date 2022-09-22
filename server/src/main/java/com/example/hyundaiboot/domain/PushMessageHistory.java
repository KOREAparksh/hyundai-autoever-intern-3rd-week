package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
//@IdClass(PushMessageHistoryId.class)
@Table(name = "PUSH_MSG_SENT_HI")
public class PushMessageHistory {
	@Id
	@Column(name = "PUSH_GEN_DT")
	private LocalDateTime generateTime;

	@Column(name = "USER_ID")
	private String user;

	@Column(name = "DEVICE_ID")
	private String userDevice;

	@Column(name = "PUSH_MSG_ID")
	private long pushMessageMaster;

//	@Id
//	@ManyToOne
//	@JoinColumns({
//			@JoinColumn(name = "PUSH_GEN_DT"),
//			@JoinColumn(name = "USER_ID"),
//			@JoinColumn(name = "DEVICE_ID"),
//			@JoinColumn(name = "PUSH_MSG_ID")
//	})
//	private PushMessageQueue pushMessageQueue;

	@Column(name = "SENT_STAT")
	private String sentState;

	@Column(name = "SENT_DT")
	private LocalDateTime sentDateTime;

}
