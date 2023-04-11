<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pt1.BoardDAO" %>
<%@ page import = "pt1.BoardDTO" %>

<html>
	<head>
		<title>공지사항</title>
	</head>
<%
	String admin = (String)session.getAttribute("memId");
	if(admin.equals("admin01") || admin.equals("admin02") || admin.equals("admin03")){%>
		<script>
			alert("관리자만 업데이트 가능");
			location="pt1/member/main.jsp";
		</script>
<%	} 
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try{
		BoardDAO BDAO = BoardDAO.getInstance();
		BoardDTO notice=  BDAO.updateGetNotice(num);

%>
		<body>
			<b>글수정</b>
			<br>
				<form method="post" name="noticeWriteform" action="noticeUpdatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
				<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr>
  						<td  width="70"  align="center">이 름</td>
						<td align="left" width="330">
							<input type="text" size="10" maxlength="10" name="writer" value="<%=notice.getWriter()%>">
							<input type="hidden" name="num" value="<%=notice.getNum()%>"></td>
					</tr>
					<tr>
  						<td  width="70"  align="center">제 목</td>
						<td align="left" width="330">
							<input type="text" size="40" maxlength="50" name="subject" value="<%=notice.getSubject()%>"></td>
					</tr>
					<tr>
  						<td  width="70"  align="center">카테고리</td>
						<td align="left" width="330">
							<input type="text" size="30" maxlength="50" name="category" value="<%=notice.getCategory()%>"></td>
					</tr>
					<tr>
  						<td  width="70"  align="center">내 용</td>
						<td align="left" width="330">
							<textarea name="content" rows="13" cols="40"><%=notice.getContent() %></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type= "submit" value="글수정">
							<input type= "reset" value="다시작성">
							<input type= "button" value="목록보기" onclick="document.location.href='notice.jsp?pageNum=<%=pageNum %>'">
						</td>
					</tr>
				</table>
			</form>
	<%	}catch(Exception e){}%>	
		</body>
</html>