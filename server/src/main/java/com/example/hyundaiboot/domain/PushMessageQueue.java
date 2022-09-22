package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "PUSH_MSG_SENT_QUEUE")
public class PushMessageQueue  implements Serializable {
	@Id
	@Column(name = "PUSH_GEN_DT")
	private LocalDateTime generateTime;

	@Id
	@ManyToOne
	private UserDevice userDevice;

	@Id
	@ManyToOne
	private PushMessageMaster pushMessageMaster;

	@Column(name = "SENT_DT")
	private LocalDateTime sentDateTime;

	@Column(name = "SENT_STAT")
	private String sentState;

	@Column(name = "SENT_CNT")
	private int sentCount;
}
