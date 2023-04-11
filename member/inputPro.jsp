<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pt1.MemberDAO" %>

    
<jsp:useBean id="member" class="pt1.MemberDTO">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
  
    MemberDAO manager = MemberDAO.getInstance();
    manager.insertMember(member);

    response.sendRedirect("loginForm.jsp");
%>