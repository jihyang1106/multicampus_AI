package com.campus.myapp.controller;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class ClovaFileUpload { // 파일 업로드 하는 기능 구현
	
	public static String fileUpload(String path, MultipartFile f) { // 파일의 경로와 파일
		String org = f.getOriginalFilename();
		try {
			f.transferTo(new File(path, org));
		}catch(Exception e) {
			
		}
		return org; 
	}
}
