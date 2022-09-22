package com.example.hyundaiboot.domain;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "DEVICE_MST")
public class DeviceMaster {
	@Id
	@Column(name = "DEVICE_ID")
	private String id;

	@Column(name = "DEVICE_KIND")
	private String kind;
}
