<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <h1>main.jsp</h1>
    
    <%
    	String sid = (String)session.getAttribute("sid");   //원래 리턴타입 object임
    	if(sid==null){ %>
    		<button onclick="location='login.jsp'">로그인</button>
    <% }else{ %>
    		<h2>[<%=sid %>]님 어서오세요</h2>
    		<button onclick="location='myinfo.jsp'">회원정보</button>
    		<button onclick="location='logout.jsp'">로그아웃</button>
    		<button onclick="location='pwForm.jsp'">회원탈퇴</button>
    		
    		
    <% } %>
    
    