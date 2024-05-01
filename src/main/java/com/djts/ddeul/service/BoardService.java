package com.djts.ddeul.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import com.djts.ddeul.mappers.BoardMapper;
import com.djts.ddeul.vo.BoardVO;
import com.djts.ddeul.vo.PaginationVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Transactional
@RequiredArgsConstructor // 의존성 주입
@Log4j2
public class BoardService {
	
	// 의존성 주입을 lombok으로 해주고 final 선언
	private final BoardMapper boardMapper;
	
	// 리스트 조회
	public List<BoardVO> list() throws Exception{
		return boardMapper.getList();
	}
	
	// 페이징 처리된 게시판 목록 조회
	public List<BoardVO> getList(PaginationVO paginationVO) throws Exception {
		
//		log.info("list service............................");
//		
//		System.out.println("pageNum : "+ paginationVO.getPageNum());
//		System.out.println("amount : " + paginationVO.getAmount());
		
		return boardMapper.getPage(paginationVO);
	}
	
	// 페이지 전체 개수 구하기
	public int getTotal(PaginationVO paginationVO) throws Exception {
		
		return boardMapper.getTotal(paginationVO);
	}
	
	// 게시글 등록
	public Long register(BoardVO boardVO) throws Exception{
		
		log.info("---------------------" + boardVO);
		
		int count = boardMapper.insert(boardVO);
		
		return boardVO.getBno();
		
	}
	
	// 게시글 조회
	public BoardVO get(Long bno) throws Exception {
		
		return boardMapper.select(bno);
	}
	
	// 게시글 수정
	public boolean modify(BoardVO vo) throws Exception{
		
		return boardMapper.update(vo) == 1;
	}
	
	
	
	
}
