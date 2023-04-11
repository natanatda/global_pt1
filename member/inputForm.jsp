<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view/color.jsp"%>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.passwd.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.passwd.value != userinput.passwd2.value)  //비밀번호랑 비밀번호확인이랑 같지않으면
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.username.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
      
        }
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {   //여기 대입되는게 this.form 폼태그임. 위에 하고 있는것처럼 도큐맨트 점 인풋 점 막 이케 해도되는데 여기선 그렇게 안한거임. 
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.jsp?id="+userinput.id.value ;  //?뒤쪽으로는 주소가 아니라 겟방식으로 보내고 있는 파라미터임. 지금은 사용자가 입력간 값을... 
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");  //새 창 나오는게 open함수임. 
    }
</script>


<body bgcolor="<%=bodyback_c%>">

<form method="post" action="inputPro.jsp" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center" bgcolor="<%=value_c%>" >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
    <tr> 
      <td width="200" bgcolor="<%=value_c%>"><b>아이디 입력</b></td>
      <td width="400" bgcolor="<%=value_c%>">&nbsp;</td>
    </tr>  

    <tr> 
      <td width="200"> ID</td>
      <td width="400"> 
        <input type="text" name="id" size="10" maxlength="12">
        <input type="button" name="confirm_id" value="ID중복확인" 
        							OnClick="openConfirmid(this.form)">  <%--html은 대소문자 상관없음. 지금 온클릭.  매개변수 보내주고있음 this= 객체를 의미함
        							                                         DTO에서 매개변수와 인스턴스변수 중 구별하여 인스턴스변수 고를때도쓰임. 여기서 this는 자기 자신을 의미하고 그 자신은 인풋태그임. 근데 여기서는 .form이라 폼태그를 의미함. 최종적으로 내가 속한 폼태그 전체를 컴펌아이디라는 속성에 넣어준거임 --%>
      </td>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="pw" size="15" maxlength="12">
      </td>
    <tr>  
      <td width="200">비밀번호 확인</td>
      <td width="400"> 
        <input type="password" name="pw2" size="15" maxlength="12">
      </td>
    </tr>
    
    <tr> 
      <td width="200" bgcolor="<%=value_c%>"><b>개인정보 입력</b></td>
      <td width="400" bgcolor="<%=value_c%>">&nbsp;</td>
    <tr>  
    <tr> 
      <td width="200">사용자 이름</td>
      <td width="400"> 
        <input type="text" name="name" size="15" maxlength="10">
      </td>
    </tr>
    <tr> 
      <td width="200">생년월일</td>
      <td width="400"> 
        <input type="text" name="birth" size="7" maxlength="6">
      </td>
    </tr>
    <tr> 
      <td width="200">전화번호</td>
      <td width="400"> 
        <input type="text" name="phonenumber" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td width="200">이메일</td>
      <td width="400"> 
        <input type="text" name="email" size="60" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center" bgcolor="<%=value_c%>"> 
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="가입안함" onclick="javascript:window.location='main.jsp'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
