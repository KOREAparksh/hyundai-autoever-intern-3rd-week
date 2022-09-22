package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Data
@Table(name = "PUSH_MSG_MST")
public class PushMessageMaster  implements Serializable {
	@Id
	@Column(name = "PUSH_MSG_ID")
	private long id;

	@Column(name = "PUSH_TITLE")
	private String title;

	@Column(name = "PUSH_CONTENT")
	private String content;
}
