<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "pt1.MemberDAO" %>
<%@ include file="/view/color.jsp"%>
<html>
<head><title>ID 중복확인</title>
<link href="style.css" rel="stylesheet" type="text/css">

<% request.setCharacterEncoding("euc-kr");%>

<%
    String id = request.getParameter("id");  //아이디 받고있음. 
	MemberDAO manager = MemberDAO.getInstance();
    int check= manager.confirmId(id);  //데이터베이스에 아이디 보내봤을때(컴펌Dao 에) 결과 나오면 중복되는거임
 %>



<body bgcolor="<%=bodyback_c%>">
<%
    if(check == 1) {  //이미 사용중
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="<%=title_c%>"> 
    <td height="39" ><%=id%>이미 사용중인 아이디입니다.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="confirmId.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td bgcolor="<%=value_c%>" align="center"> 
       다른 아이디를 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="id"> 
       <input type="submit" value="ID중복확인">  <%-- 섭밋으로 보내고 있는 경로가 컨펌임. 자기자신한테 보내서 처음부터 다시 검사 하는거임 --%>
    </td>
  </tr>
</table>
</form>
<%
    } else { //사용쌉가능 
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="<%=title_c%>"> 
    <td align="center"> 
      <p>입력하신 <%=id%> 는 사용하실 수 있는 ID입니다. </p>
      <input type="button" value="닫기" onclick="setid()">  <%-- 닫기 누르면 온클릭으로 이벤트... 셋아이디 호출--%> 
    </td>
  </tr>
</table>
<%
    }
%>
</body>
</html>
<script language="javascript">

  function setid()
    {		
    	opener.document.userinput.id.value="<%=id%>";  <%-- 오프너 - 새창을 띄운 페이지를 말함. 그니까 새창말고 이걸 띄운 부모페이지. 여기서는 회원가입창. 부모페이지ㅡ이 도큐멘트의 유저인풋에 아이디값에 대입해라.라는거임 여기서 이 줄 다 분석해보면--%>
		self.close();  <%--새창띄운거 닫아라--%>
	}
		