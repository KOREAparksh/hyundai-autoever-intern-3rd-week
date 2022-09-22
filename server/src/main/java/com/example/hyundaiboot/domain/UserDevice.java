package com.example.hyundaiboot.domain;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "USER_DEVICE_MGR")
@IdClass(UserDeviceId.class)
@ToString(callSuper = true)
public class UserDevice {
//	@Id
//	@Column(name = "USER_ID")
//	private String user_id;

	@Id
	@ManyToOne
	@JoinColumn(name = "USER_ID")
	private User user;

	@Id
	@ManyToOne
	@JoinColumn(name = "DEVICE_ID")
	private DeviceMaster deviceMaster;

	@Column(name = "MAX_RESENT_CNT")
	private int max_sent_count;

	@Column(name = "USER_DEVICE_DESC")
	private String description;

	@Column(name = "USE_YN")
	private String useState;
}
