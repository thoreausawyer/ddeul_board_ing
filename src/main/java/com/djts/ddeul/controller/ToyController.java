package com.djts.ddeul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/toy")
public class ToyController {
	
	@GetMapping("/sample")
	public void sample1() {
	}
	
	@GetMapping("/todo")
	public void list() {
	}
	
	@GetMapping("/convert")
	public void convert() {
	}
	

}
