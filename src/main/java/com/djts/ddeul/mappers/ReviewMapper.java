package com.djts.ddeul.mappers;

import java.util.List;

import com.djts.ddeul.vo.ReviewVO;

public interface ReviewMapper {
	
	// 리스트 조회
	public List<ReviewVO> getList();
	
	// 게시글 등록
	public int insert(ReviewVO reviewVO);
	
	// 게시글 조회 // 게시글은 하나의 객체만 있으면 되니까, List아니어도 된다.
	public ReviewVO select(Long bno);
	

}
