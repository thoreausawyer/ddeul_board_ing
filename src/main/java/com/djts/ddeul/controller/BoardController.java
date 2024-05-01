package com.djts.ddeul.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.djts.ddeul.service.BoardService;
import com.djts.ddeul.vo.BoardVO;
import com.djts.ddeul.vo.PageDTO;
import com.djts.ddeul.vo.PaginationVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor // 의존성 주입
@Log4j2
@RequestMapping("/board")
public class BoardController {
	
	// 의존성 주입을 lombok으로 해주고 final 선언
	private final BoardService boardService;
	
	// 게시판 목록 조회
	/*
	 * @GetMapping("/list") public void list(Model model) throws Exception{
	 * log.info("list................");
	 * 
	 * List<BoardVO> list = boardService.list(); log.info(list);
	 * 
	 * model.addAttribute("list", list); }
	 */
	
	// 페이징 처리된 게시판 목록 조회
	@GetMapping("/list")
	public void list(
				@ModelAttribute("pn")PaginationVO paginationVO,
				Model model) throws Exception {
		log.info("list............................");
		log.info("paginationVO :" + paginationVO);
		
		System.out.println("pageNum : "+ paginationVO.getPageNum());
		System.out.println("amount : " + paginationVO.getAmount());
		System.out.println("keyword : " + paginationVO.getKeyword());
		
		List<BoardVO> list = boardService.getList(paginationVO);
		
		log.info(list);
		log.info("리스트출력");
		log.info("리스트출력");
		log.info("리스트출력");
		log.info("리스트출력");
		log.info("리스트출력");
		
		model.addAttribute("list", list);
		
		PageDTO pageDTO = new PageDTO(boardService.getTotal(paginationVO) ,paginationVO);
		
		model.addAttribute("pageMaker", pageDTO);
	}
	
	// 게시글 조회 및 수정 화면
	@GetMapping("/{job}/{bno}")
	public String read(
			@PathVariable(name= "job") String job, 
			@PathVariable(name= "bno") Long bno, Model model
			) throws Exception {
		
		log.info("job:" + job);
		log.info("bno:" + bno);
		
		if( !(job.equals("read") || job.equals("modify")) ){
			throw new RuntimeException("Bad Request job");
		}
		
		BoardVO boardVO = boardService.get(bno);
		
		log.info("boardVO : " + boardVO);
		
		model.addAttribute("vo", boardVO);
		
		return "/board/" + job;
	}
	
	// 게시글 등록 화면
	@GetMapping("/register")
	public void register() {
		
	}
	
	// 게시글 등록
	@PostMapping("/register")
	public String registerPost(BoardVO boardVO, RedirectAttributes rttr) throws Exception{
		
		log.info("boardVO" + boardVO);
		
		Long bno = boardService.register(boardVO);
		
		log.info("bno: " + bno);
		
		rttr.addFlashAttribute("result", bno);
		
		return "redirect:/board/list";
	}
	
	// 게시글 삭제
	@PostMapping("/remove/{bno}")
	public String remove(
			@PathVariable(name="bno") Long bno,
			RedirectAttributes rttr) throws Exception{
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(bno);
		boardVO.setTitle("해당 글은 삭제되었습니다.");
		boardVO.setContent("해당 글은 삭제되었습니다.");
		
		log.info("boardVO: " + boardVO);

		boardService.modify(boardVO);
		
		rttr.addFlashAttribute("result", boardVO.getBno());
		
		return "redirect:/board/list";
	}
	
	// 게시글 수정
	@PostMapping("/modify/{bno}")
	public String modify(
			@PathVariable(name="bno") Long bno,
			BoardVO boardVO ) throws Exception{ // 클라이언트에서 request된 파라미터 값 수집
		
		boardVO.setBno(bno);
		
		log.info("boardVO: " + boardVO);
		
		boardService.modify(boardVO);
		
		return "redirect:/board/read/" + bno;
	}
	
	@GetMapping("/test")
	public String test() {
		return "/board/template";
	}
	
}
