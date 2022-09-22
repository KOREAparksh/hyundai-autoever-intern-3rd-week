package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@IdClass(UserMessageGroupId.class)
@Table(name = "USER_MSG_GRP")
public class UserMessageGroup {
	@Id
	@JoinColumn(name = "USER_ID")
	@ManyToOne
	private User user;

	@Id
	@JoinColumn(name = "PUSH_GRP_ID")
	@ManyToOne
	private PushMessageGroup pushMessageGroup;
}
