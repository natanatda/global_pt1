<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1> 로그인 </h1>

<%--
	String cooId = null;
	String cooPw = null;
	Cookie [] cookies = request.getCookies();
	for(Cookie c : cookies){
		if(c.getName().equals("cooId")){
			cooId = c.getValue();
		}if(c.getName().equals("cooPw")){
			cooPw = c.getValue();
		}
	}
	if(cooId !=null && cooPw !=null){
		response.sendRedirect("loginPro.jsp");
	}
		
--%>

<form action= "loginPro.jsp" method="post">
	id :<input type="text"  name="id" /> <br/>

	
	pw :<input type="password"  name="pw" /> <br/>

		
	            <input type="submit" value="로그인" />
	            	  
	            	  <input type="checkbox" name="auto" value="1"/>자동로그인 
	            	  <br>
	            	  <br>
	            	  <input type="button" value="비회원 로그인" onclick="javascript:window.location='guestloginForm.jsp'">
	                 
</form>


