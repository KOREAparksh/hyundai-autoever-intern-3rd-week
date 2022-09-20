package com.example.hyundaiboot.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "USER_DEVICE_MGR")
public class UserDevice {
	@Column(name = "USER_ID")
	private String id;
}
