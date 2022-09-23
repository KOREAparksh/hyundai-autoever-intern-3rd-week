package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "PUSH_MSG_GRP")
public class PushMessageGroup {
	@Id
	@Column(name = "PUSH_GRP_ID")
	String id;

	@Column(name = "PUSH_GRP_NAME")
	String name;

	@Column(name = "USE_YN")
	String isUsed;

	@Column(name = "REG_DT")
	LocalDateTime generateTime;
}
