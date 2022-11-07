package com.kh.common;

import java.util.Random;

public class RandomCodeGenerator {
	
	public static String getRandomCode() {
		
		int leftLimit = 48; // 아스키 코드 시작
		int rightLimit = 122; // 아스키 코드 끝
		int targetStringLength = 10; // 랜덤코드 생성 자리 수
		Random random = new Random();
		
		String randomCode = random.ints(leftLimit,rightLimit + 1)
				/*
				 * 숫자 아스키 코드 : 48 ~ 57
				 * 대문자 아스키 코드 : 65 ~ 90
				 * 소문자 아스키 코드 : 97 ~ 122
				 */
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
				.limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
		
		return randomCode;
	}
	
}
