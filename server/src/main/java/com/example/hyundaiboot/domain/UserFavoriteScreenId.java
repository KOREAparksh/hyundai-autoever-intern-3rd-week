package com.example.hyundaiboot.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
public class UserFavoriteScreenId implements Serializable {
	private String user;
	private String screenDefine;
}
