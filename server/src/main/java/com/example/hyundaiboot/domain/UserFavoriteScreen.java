package com.example.hyundaiboot.domain;

import com.sun.istack.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@RequiredArgsConstructor
@IdClass(UserFavoriteScreenId.class)
@Table(name = "USER_FAVORITE_SCR")
@EqualsAndHashCode
public class UserFavoriteScreen {
	@Id
	@ManyToOne
	@JoinColumn(name = "USER_ID")
	@NotNull
	private User user;


	@Id
	@ManyToOne
	@JoinColumn(name = "SCR_ID")
	@NotNull
	private ScreenDefine screenDefine;

	@Column(name = "REG_DT")
	@CreatedDate
	private LocalDateTime createAt;
}
