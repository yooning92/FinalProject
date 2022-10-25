package com.itwill.brown_carrot_market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	//@Autowired
	// private HelloService helloService;

	public MainController() {
		System.out.println(">> MainController생성");
	}

	@RequestMapping(value = {"main","/"})
	public String main() {
		return "main";
	}

}