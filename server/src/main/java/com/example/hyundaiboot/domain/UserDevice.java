package com.example.hyundaiboot.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "USER_DEVICE_MGR")
@EqualsAndHashCode()
@IdClass(UserDeviceId.class)
public class UserDevice {
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
