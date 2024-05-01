package com.djts.ddeul.mappers;

import java.util.List;

import com.djts.ddeul.vo.BoardVO;
import com.djts.ddeul.vo.PaginationVO;

public interface BoardMapper {
	
	// 리스트 조회
	List<BoardVO> getList() throws Exception;
	
	// 게시글 등록
	int insert(BoardVO boardVO) throws Exception; 
	
	// 게시글 조회
	BoardVO select(Long bno) throws Exception;
	
	// 게시글 수정
	int update(BoardVO boardVO) throws Exception;
	
	// 게시글 삭제는 -> 내용물을 '삭제되었습니다.' 로 수정 해주는 게 낫고,
    // -> column을 하나 둬서 Y/N 처리 해서 숨김 처리 하는 게 낫다. 왜? 외래키(foreign key)를 물고 있는 경우가 많아서.
	
	// 페이징처리 조회
	List<BoardVO> getPage(PaginationVO paginationVO) throws Exception;
	
	// 전체 개수 구하기
	int getTotal(PaginationVO paginationVO) throws Exception;
	
}
