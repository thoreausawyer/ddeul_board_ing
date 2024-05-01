package com.djts.ddeul.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.djts.ddeul.service.ReviewService;
import com.djts.ddeul.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
@Log4j2
public class ReviewController {
	
	private final ReviewService reviewService;
	
	// 게시판 목록 조회
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("목록 시작.................");
		
		List<ReviewVO> reviewList = reviewService.list();
		
		log.info("목록 조회" + reviewList);
		
		model.addAttribute("list", reviewList);
		
	}
	
	// 게시글 등록
	@PostMapping("/register")
	public String postRegister(ReviewVO reviewVO, RedirectAttributes rttr) {
		
		Long bno = reviewService.register(reviewVO);
		
		rttr.addFlashAttribute("result", bno);
		
		return "redirect:/board/list";
	}
	
	// 게시글 조회
	@GetMapping("/{job}/{bno}")
	public String read(
						@PathVariable(name="job") String job,
						@PathVariable(name="bno") Long bno,
						Model model) {
		
		log.info("job:" + job);
		log.info("bno:" + bno);
		
		if(!(job.equals("read") || job.equals("modify"))) {
			throw new RuntimeException("Bad Request job!");
		}
		
		ReviewVO reviewVO = reviewService.get(bno);
		
		model.addAttribute("vo", reviewVO);
		
		return "/board/"+job;
	}

}
