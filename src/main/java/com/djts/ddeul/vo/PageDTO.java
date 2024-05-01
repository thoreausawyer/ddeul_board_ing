package com.djts.ddeul.vo;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class PageDTO {

	private int startPage; // 화면에서의 시작 번호
	private int endPage; // 화면에서의 마지막 번호
	private boolean prev, next;
	
	private int total;
	private PaginationVO pn;
	
	public PageDTO(int total, PaginationVO pn) {
		
		this.pn = pn;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(pn.getPageNum() / 10.0)) * 10;

		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil(total * 1.0) / pn.getAmount());
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
	
	
}
