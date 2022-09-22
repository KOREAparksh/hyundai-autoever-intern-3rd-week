package com.example.hyundaiboot.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
public class PushMessageHistoryId implements Serializable {
	private PushMessageQueQueId pushMessageQueQue;
}
