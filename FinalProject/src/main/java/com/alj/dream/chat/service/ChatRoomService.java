package com.alj.dream.chat.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alj.dream.chat.dao.ChatDao;
import com.alj.dream.chat.domain.Chat;

@Service
public class ChatRoomService {

	
	private ChatDao dao;
	@Autowired 
	private SqlSessionTemplate template;
	
	// DB에 채팅데이터 있는지 확인하기
	public List<Chat> getChat(int myIdx, int matchidx, int reciever) {
		
		dao = template.getMapper(ChatDao.class);
		
		List<Chat> chatlist = dao.selectChatByMatchidx(matchidx);
		System.out.println("ChatRoomService : getChat :"+chatlist);
		return chatlist;
	}
	
	
	// DB에 채팅데이터 insert
	public int insertChat(Chat chat) {
		
		System.out.println(chat.getM_reciever());
		System.out.println(chat.getM_sender());
		System.out.println(chat.getMessage());
		System.out.println(chat.getMatch_idx());
		
		System.out.println("ChatInsertService : insertChat메소드");
		
		dao = template.getMapper(ChatDao.class);
		int resultCnt = dao.insertChat(chat);
		//System.out.println("Chat_IDX>>>".concat(String.valueOf(chat.getChat_idx())));
		
		System.out.println("chatinsert성공. 리턴합니다");
		
		return resultCnt;
	}


	
	
	
}