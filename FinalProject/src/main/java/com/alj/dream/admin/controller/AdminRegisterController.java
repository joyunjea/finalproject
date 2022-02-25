package com.alj.dream.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/superadmin/admin/register")
public class AdminRegisterController {
	
	
	@GetMapping
	public String showAdminRegisterForm() {
		
		return "admin/registerform";
	}
	
	@PostMapping
	@ResponseBody
	public int registerAdmin() {
		
		
		return 0;
	}
	
}
