<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "pt1.BoardDAO" %>
<%@ page import = "pt1.BoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>

<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List noticeList = null;
	BoardDAO BDAO = BoardDAO.getInstance();
	count = BDAO.getNoticeCount();
	if(count > 0){
		noticeList = BDAO.getNotices(startRow,endRow);
	}
	
	number = count - (currentPage - 1) *pageSize;
%>
	
<html>
	<head>
		<title>공지사항</title>
	</head>
	<body>
		<b>글목록(전체 글:<%=count%>)</b>
		<table width="700">
			<tr>
				<td align="right">
				<%if(session.getAttribute("memId")==null) {%>
					<a href="/pt1/member/loginForm.jsp">로그인</a>
				<%}else{ %>
					<a href=noticeWriteForm.jsp">글쓰기</a>
				<%} %>
				</td>
		</table>
	<%
		if(count == 0){
	%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
				공지사항이 없습니다.
				</td>
		</table>
	<% }else { %>
		<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
			<tr height="30">
				<td align="center" width="50">글번호</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="150">날짜</td>
				<td align="center" width="100">카테고리</td>
			</tr>
	<%}%>
<%
	if(count > 0){
		int pageCount = count / pageSize +(count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage > 10){		%>
			<a href="notice.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
<%		}
		for(int i = startPage ; i <= endPage ; i++){	%>
			<a href="notice.jsp?pageNum=<%=i %>">[<%=i%>]</a>
<%		}
		if(endPage < pageCount) {	%>
			<a href="notice.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
%>
	</table>
	
	</body>
</html>

	