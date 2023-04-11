<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pt1.BoardDAO" %>
<%@ page import = "pt1.BoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>
<head>
<title>게시판</title>
</head>

<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
      BoardDAO BDAO= BoardDAO.getInstance();
      BoardDTO notice =  BDAO.getNotice(num);
	  
%>
<body >  
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">  
  <tr height="30">
    <td align="center" width="125">글번호</td>
    <td align="center" width="125" align="center">
	     <%=notice.getNum()%></td>

  </tr>
  <tr height="30">
    <td align="center" width="125">작성자</td>
    <td align="center" width="125" align="center">
	     <%=notice.getWriter()%></td>
    <td align="center" width="125" >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(notice.getReg())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=notice.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125">글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=notice.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4 align="right" > 
    <%
    	String id = (String)session.getAttribute("memId");
    	if(id != null){
    		if(id.equals("admin1") || id.equals("admin2") || id.equals("admin3")){	//참조형은 equals로 비교
    %>
				<input type="button" value="글수정" 
     	  		onclick="document.location.href='noticeUpdateForm.jsp?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>'">
		   		&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" 
     	  		onclick="document.location.href='noticeDeleteForm.jsp?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>'">
	  	 		&nbsp;&nbsp;&nbsp;&nbsp;
	<%		} 
		} %>
    	<input type="button" value="글목록" 
       	onclick="document.location.href='notice.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>      
</body>
</html>      
