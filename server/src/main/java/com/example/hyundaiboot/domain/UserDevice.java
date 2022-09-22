package com.example.hyundaiboot.domain;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "USER_DEVICE_MGR")
public class UserDevice implements Serializable {
//	@Id
//	@Column(name = "USER_ID")
//	private String user_id;

	@Id
	@ManyToOne
	@ToString.Exclude
	private User user;

//	@Id
//	@Column(name = "DEVICE_ID")
//	private String device_id;

	@Id
	@ManyToOne
	@ToString.Exclude
	private DeviceMaster deviceMaster;

	@Column(name = "MAX_RESENT_CNT")
	private int max_sent_count;

	@Column(name = "USER_DEVICE_DESC")
	private String description;

	@Column(name = "USE_YN")
	private String useState;
}
