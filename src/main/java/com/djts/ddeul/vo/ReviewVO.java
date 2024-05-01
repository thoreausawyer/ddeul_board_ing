package com.djts.ddeul.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	
	private LocalDateTime writeDate;
	private LocalDateTime updateDate;

}
