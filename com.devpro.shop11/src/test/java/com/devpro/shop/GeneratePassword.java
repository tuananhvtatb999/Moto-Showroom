package com.devpro.shop;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeneratePassword {
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
		String result = encoder.encode("d2VsY29tZSB0byB0aGUgaGFja2F0aG9uIHJhY2U=");
		System.out.println(result);
	}
}
