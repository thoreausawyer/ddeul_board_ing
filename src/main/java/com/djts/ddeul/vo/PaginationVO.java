package com.djts.ddeul.vo;

import lombok.Data;

@Data
public class PaginationVO { 
	
	private int pageNum = 1;
	private int amount = 10;
	
	//null, T, C, W, TC, TW, TCW
	private String[] types;
	private String keyword;
	
	public void setPageNum(int pageNum) {
		
		if(pageNum <= 0) {
			this.pageNum = 1;
			return;
		}
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		
		if(amount <= 10 || amount > 100) {
			this.amount = 10;
			return;
		}
		this.amount = amount;
	}
	
	// 마이바티스는 변수가 꼭 있어야 getter/setter를 생성할 수 있는 것은 아니다
	public int getSkip() {
		if(this.pageNum == 1) {
			return (this.pageNum - 1 ) * this.amount;
		}else {
			return (((this.pageNum - 1 ) * this.amount)) + 1;
		}
		
	}
}
