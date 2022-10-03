package com.example.hyundaiboot.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "SCR_DF")
@EqualsAndHashCode
public class ScreenDefine {
	@Id
	@Column(name = "SCR_ID")
	private String screenId;

	@Column(name = "SCR_NAME")
	private String name;

	@Column(name = "PARENT_SCR_ID")
	private String parentId;

	@Column(name = "SCR_SORT")
	private int sort;

	@Column(name = "SCR_URL")
	private String url;

	@Column(name = "REG_DT")
	@CreatedDate
	private LocalDateTime createAt;
}
