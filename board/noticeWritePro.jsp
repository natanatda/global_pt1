<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pt1.BoardDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<jsp:useBean id="notice" scope="page" class="pt1.BoardDTO">
   <jsp:setProperty name="notice" property="*"/>
</jsp:useBean>

<%
	notice.setReg(new Timestamp(System.currentTimeMillis()) );
	//작성자 id로 대체
	String id = (String)session.getAttribute("memId");
	notice.setWriter(id);
	BoardDAO BDAO= BoardDAO.getInstance();
    BDAO.insertNotice(notice);

    response.sendRedirect("notice.jsp");
%>