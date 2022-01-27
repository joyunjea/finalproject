package com.alj.dream;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class HomeController {

	
	
	
	
	@GetMapping
	public String home(Locale locale, Model model) {
		return "home";
	}

	
}
