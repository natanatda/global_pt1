<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "pt1.MemberDAO" %>
<%@ include file="/view/color.jsp"%>
<html>
<head><title>ID �ߺ�Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">

<% request.setCharacterEncoding("euc-kr");%>

<%
    String id = request.getParameter("id");  //���̵� �ް�����. 
	MemberDAO manager = MemberDAO.getInstance();
    int check= manager.confirmId(id);  //�����ͺ��̽��� ���̵� ����������(����Dao ��) ��� ������ �ߺ��Ǵ°���
 %>



<body bgcolor="<%=bodyback_c%>">
<%
    if(check == 1) {  //�̹� �����
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="<%=title_c%>"> 
    <td height="39" ><%=id%>�̹� ������� ���̵��Դϴ�.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="confirmId.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td bgcolor="<%=value_c%>" align="center"> 
       �ٸ� ���̵� �����ϼ���.<p>
       <input type="text" size="10" maxlength="12" name="id"> 
       <input type="submit" value="ID�ߺ�Ȯ��">  <%-- �������� ������ �ִ� ��ΰ� ������. �ڱ��ڽ����� ������ ó������ �ٽ� �˻� �ϴ°��� --%>
    </td>
  </tr>
</table>
</form>
<%
    } else { //���԰��� 
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="<%=title_c%>"> 
    <td align="center"> 
      <p>�Է��Ͻ� <%=id%> �� ����Ͻ� �� �ִ� ID�Դϴ�. </p>
      <input type="button" value="�ݱ�" onclick="setid()">  <%-- �ݱ� ������ ��Ŭ������ �̺�Ʈ... �¾��̵� ȣ��--%> 
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
    	opener.document.userinput.id.value="<%=id%>";  <%-- ������ - ��â�� ��� �������� ����. �״ϱ� ��â���� �̰� ��� �θ�������. ���⼭�� ȸ������â. �θ����������� ��ť��Ʈ�� ������ǲ�� ���̵𰪿� �����ض�.��°��� ���⼭ �� �� �� �м��غ���--%>
		self.close();  <%--��â���� �ݾƶ�--%>
	}
		