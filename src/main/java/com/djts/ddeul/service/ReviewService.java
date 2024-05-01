package com.djts.ddeul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.djts.ddeul.mappers.ReviewMapper;
import com.djts.ddeul.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor 
@Log4j2
@Transactional
public class ReviewService {
	
	private final ReviewMapper reviewMapper; // 의존성 주입 방법 1
	
	//@Autowired
	//private ReviewMapper reviewMapper; // 방법 2
	
	// 게시판 목록 조회
	public List<ReviewVO> list(){
		return reviewMapper.getList();
	};
	
	// 게시글 등록
	public Long register(ReviewVO reviewVO) {
		
		int count = reviewMapper.insert(reviewVO);
		
		return reviewVO.getBno();
	}
	
	// 게시글 조회
	
	public ReviewVO get(Long bno) {
		return reviewMapper.select(bno);
	}

}
