package com.alj.dream.post.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alj.dream.post.service.RequestPostService;

@Controller
public class RequestPostController {

	@Autowired
	RequestPostService service;
	
	//받은제의 리스트를 보여주는 곳 > 파라미터로 선택한 게시글의 post_idx를 넘겨받는다
	@GetMapping("/post/requestpost")
	public void getRequestPost(
				HttpSession session,
				@RequestParam("postidx") int postidx,
				Model model
				) {
			//modelattribute에 객체 추가하기
		System.out.println(postidx);
		
		model.addAttribute("requestPost", service.getRequestPost(postidx));
		
		System.out.println("서비스에 getRequestPost메소드실행 성공");
	}
	
}