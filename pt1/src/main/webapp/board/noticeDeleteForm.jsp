<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<html>
	<head>
		<title>공지사항</title>
	</head>
<%	String admin = (String)session.getAttribute("memId");
	if(admin.equals("admin01") || admin.equals("admin02") || admin.equals("admin03")){%>
		<script>
			alert("관리자만 삭제 가능");
			location="/pt1/member/main.jsp";
		</script>
<%} %>
	<body>
		<b>글삭제</b>
		<br>
			<form method="post" name="noticeDeleteForm" action="noticeDeletePro.jsp?pageNum=<%=pageNum%>">
				<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
					<tr height="30">
						<td align="center">
							<input type="submit" value="글삭제" >
							<input type="button" value="글목록" onclick="document.location.href='notice.jsp?pageNum=<%=pageNum%>'">     
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>


