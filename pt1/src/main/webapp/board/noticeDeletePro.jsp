<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pt1.BoardDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDAO BDAO= BoardDAO.getInstance();
	int check = BDAO.deleteNotice(num);
	
	if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=notice.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
       <script language="JavaScript">      
         alert("관리자가 아닙니다.");
         history.go(-1);
      </script>
<%
    }
 %>