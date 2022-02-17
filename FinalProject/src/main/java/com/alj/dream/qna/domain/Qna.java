package com.alj.dream.qna.domain;

import java.util.List;

import com.alj.dream.reply.domain.ReplyRegisterData;

public class Qna {
	
	private String qna_idx;
	private String qna_title;
	private String qna_regdate;
	private  List<ReplyRegisterData> list;
	
	public Qna() {
	}

	public Qna(String qna_idx, String qna_title, String qna_regdate, List<ReplyRegisterData> list) {
		this.qna_idx = qna_idx;
		this.qna_title = qna_title;
		this.qna_regdate = qna_regdate;
		this.list = list;
	}

	public String getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(String qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public List<ReplyRegisterData> getList() {
		return list;
	}

	public void setList(List<ReplyRegisterData> list) {
		this.list = list;
	}

	
	
}
