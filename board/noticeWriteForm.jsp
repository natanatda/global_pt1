<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	<title>공지사항</title>
	</head>
<%	String admin = (String)session.getAttribute("memId");
	if(admin.equals("admin01") || admin.equals("admin02") || admin.equals("admin03")){%>
	<script>
		alert("관리자만 글쓰기 가능");
		location="/pt1/member/main.jsp";
	</script>
<%	}
	int num = 0;
	try{	
		num=Integer.parseInt(request.getParameter("num"));
%>
	<body>
		<b>글쓰기</b>
		<br>
			<form method="post" name="noticewriteform" action="noticeWritePro.jsp" onsubmit="return writeSave()">
				<input type="hidden" name="num" value="<%=num%>">
				
				<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr>
   						<td align="right" colspan="2">
	   						<a href="notice.jsp"> 글목록</a> 
  						</td>
  					</tr>
  					<tr>
   						<td  width="70" align="center" >제 목</td>
						<td  width="330">
							<input type="text" size="40" maxlength="50" name="subject"></td>
					</tr>
					<tr>
						<td  width="70" align="center" >내 용</td>
						<td  width="330" >
						<textarea name="content" rows="13" cols="40"></textarea> </td>
					</tr>
					<tr>      
						<td colspan=2  align="center"> 
							<input type="submit" value="글쓰기" >  
							<input type="reset" value="다시작성">
							<input type="button" value="목록보기" OnClick="window.location='notice.jsp'">
						</td></tr></table>    	
<%
	}catch(Exception e){}
%>
	</form>
	</body>
</html>