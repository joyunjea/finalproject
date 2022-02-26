package com.alj.dream.file_notice.domain;

public class NoticeFileInfo {
	
	private String file_nm;
	private int file_size;
	private String file_exet;
	private String file_originnm;
	private int notice_idx;
	
	
	public NoticeFileInfo() {
		
	}


	public NoticeFileInfo(String file_nm, int file_size, String file_exet, String file_originnm, int notice_idx) {
		super();
		this.file_nm = file_nm;
		this.file_size = file_size;
		this.file_exet = file_exet;
		this.file_originnm = file_originnm;
		this.notice_idx = notice_idx;
	}


	public String getFile_nm() {
		return file_nm;
	}


	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}


	public int getFile_size() {
		return file_size;
	}


	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}


	public String getFile_exet() {
		return file_exet;
	}


	public void setFile_exet(String file_exet) {
		this.file_exet = file_exet;
	}


	public String getFile_originnm() {
		return file_originnm;
	}


	public void setFile_originnm(String file_originnm) {
		this.file_originnm = file_originnm;
	}


	public int getNotice_idx() {
		return notice_idx;
	}


	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}


	

}
