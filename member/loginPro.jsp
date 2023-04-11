<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="pt1.MemberDAO" %>

  
    <jsp:useBean id="dto" class="pt1.MemberDTO"/>
    <jsp:setProperty property="*" name="dto"/>
    
    <jsp:useBean id="dao" class="pt1.MemberDAO" />
    
    
 
  <%
    	boolean result = dao.loginCheck(dto);
    	if(result){
    		//세션(브,ip,값)  서버에 저장만하는거임. 전달개념아님.
    		session.setAttribute("sid", "dto.getId()");    //application.setAttribute(arg0,arg1);
    		response.sendRedirect("main.jsp");  //이동만하는거임 
    	}else{ %>
    		<script>
    			alert("아이디/비밀번호 확인하세요")
    			history.go(-1);   // 이전페이지로 돌아가는거
    			
    			</script>
    	<%	} %>


   
    	
    	