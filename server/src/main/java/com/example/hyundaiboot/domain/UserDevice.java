package com.example.hyundaiboot.domain;

import com.sun.istack.NotNull;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "USER_DEVICE_MGR")
@EqualsAndHashCode()
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
@IdClass(UserDeviceId.class)
public class UserDevice {
	@Id
	@ManyToOne
	@JoinColumn(name = "USER_ID")
	@NotNull
	private User user;

	@Id
	@ManyToOne
	@JoinColumn(name = "DEVICE_ID")
	@NotNull
	private DeviceMaster deviceMaster;

	@Column(name = "MAX_RESENT_CNT")
	private int maxSentCount;

	@Column(name = "USER_DEVICE_DESC")
	private String description;

	@Column(name = "USE_YN")
	private String useState;
}
