package com.asm2.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.filter.HttpFilter;

@WebFilter("/*")
public class Utf8Filter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws  IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

}
