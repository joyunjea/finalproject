package com.alj.dream.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alj.dream.notice.domain.NoticeRegisterData;
import com.alj.dream.notice.service.RegNoticeService;

import security.AccountDetails;

@Controller
@RequestMapping("/admin/notice/register")
public class RegNoticeController {
	
	@Autowired
	private RegNoticeService regNoticeService;
	
	@GetMapping
	public String showNoticeRegisterForm() {
		
	
		
		return "notice/noticeregisterform";
		
	}
	
	@PostMapping
	@ResponseBody
	public int insertNotice(Authentication auth, NoticeRegisterData data) {
		
		
		int result=0;
		
		try {
		  result=regNoticeService.insertNotice(auth, data);
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		System.out.println(result);
		
		
		return result;
	}
}
