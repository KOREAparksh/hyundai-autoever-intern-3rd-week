package com.example.hyundaiboot.domain;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@RequiredArgsConstructor
public class User {
	@Id
	@Column(name = "USER_ID")
	private String id;

	@Column(name = "USER_NAME")
	private String name;

	@Column(name = "USER_PWD")
	private String pw;

	@Column(name = "USER_FONT")
	private String font;

	@Column(name = "USER_LANG")
	private String lang;

	@Column(name = "USER_COLOR")
	private String color;

}
