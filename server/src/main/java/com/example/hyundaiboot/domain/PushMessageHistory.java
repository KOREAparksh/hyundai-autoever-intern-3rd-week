package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "PUSH_MSG_SENT_HI")
public class PushMessageHistory  implements Serializable {
	@Id
	@ManyToOne
	private PushMessageQueue pushMessageQueue;

	@Column(name = "SENT_STAT")
	private String sentState;

	@Column(name = "SENT_DT")
	private LocalDateTime sentDateTime;
}
