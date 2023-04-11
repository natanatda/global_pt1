<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>main.jsp</title>
<%
	//Type 파라미터를 받을 변수 Type
	String Type = request.getParameter("Type");
%>

<%-- 5~14 line 해당 이미지를 클릭하면 각각의 페이지로 이동 --%>
<a href="main.jsp">
<img src="/pt1/board/image/main_image.png" width="80" height="30"/></a>
<a href="shop.jsp">
<img src="/pt1/board/image/shop_image.png" width="80" height="30"/></a>
<a href="item.jsp">
<img src="/pt1/board/image/item_image.png" width="80" height="30"/></a>
<a href="sale.jsp">
<img src="/pt1/board/image/sale_image.png" width="80" height="30"/></a>
<a href="more.jsp">
<img src="/pt1/board/image/more_image.png" width="80" height="30"/></a>
<%-- 로그인 페이지로 이동 (수정) --%>
 <table>
 	<form name="login" method="post" action="login.jsp" align="right">
 		<tr>
 			<td width="100" align="right">아이디</td>
 			<td width="100">
 			<input type="text" name="id" size="15"></td>
 		</tr>
 		<tr>
 			<td width="100" align="right">패스워드</td>
 			<td width="100">
 			<input type="password" name="passwd" size="15"></td>
 		</tr>
 		<tr>
 			<td colspan="3" align="center">
 			<input type="checkbox">자동 로그인
 			<input type="submit" value="로그인">
 			<input type="button" value="회원가입" onclick="location='inputForm.jsp'">
 			<a href="findForm.jsp">ID/PW 찾기</a></td>
 		</tr>
 		<tr>
 			<td>
 				<%--검색 기능 추가 --%>
 				<input type="text" value="상품 입력" name="gsearch" size="10" maxlength="12">
				<input type="button" value="상품검색" name="gsearch"
					onclick="location='/pt1/board/gsearch.jsp'" />
			</td>
			<td>
 				<%--검색 기능 추가 --%>
 				<input type="text" value="브랜드 입력" name="bsearch" size="10" maxlength="12">
				<input type="button" value="브랜드검색" name="bsearch"
					onclick="location='/pt1/board/bsearch.jsp'" />
			</td>
		</tr>
		<tr>
			<td>
				<%-- 페이지 이동 --%>
				<input type="button" value="베스트상품 페이지로 이동" 
					onclick="location='/pt1/board/best.jsp'" /><br />
			</td>
		</tr>
		<tr>
			<td>
				<%-- goods_image.png 사진 클릭하면 Type=S 파라미터 추가 --%>
				<a href="main.jsp?Type=S">
				<img src="/pt1/board/image/goods_image.png" width="80" height="30"/></a>
			</td>
			<td>
				<%-- brand_image.png 사진 클릭하면 Type=B 파라미터 추가 --%>
				<a href="main.jsp?Type=B">
				<img src="/pt1/board/image/brand_image.png" width="80" height="30"/></a>
			</td>
		</tr>
		<tr>
			<td>
				<%
					//Type 파라미터가 null인 경우 즉 처음 페이지를 들어갔을 경우 또는 
					//Type 파라미터가 S인 경우	  즉 goods_image.png를 클릭했을 경우 
					if(Type==null || Type.equals("S")){
					//상품 목록 보여줌
				%>
				<h1>상품 이미지</h1>
				<h1>상품 이미지</h1>
				<h1>상품 이미지</h1>
				<%
					//Type 파라미터가 B인 경우		즉 brand_image.png를 클릭했을 경우 
					} else if(Type.equals("B")){
					//브랜드 목록 보여줌
				%>
				<h1>브랜드 이미지</h1>
				<h1>브랜드 이미지</h1>
				<h1>브랜드 이미지</h1>
				<%}
				%>
			</td>
		</tr>
		<tr>
			<td>
				<%-- 수정필요 일단 넣어둠 --%>
				<input type="button" value="카테고리" 
					onclick="location='/pt1/board/search.jsp'" />
			</td>
		</tr>
		<tr>
			<td>
				<%-- 공지사항 페이지로 이동 --%>
				<input type="button" value="공지사항" 
					onclick="location='/pt1/board/search.jsp'" />
			</td>
		</tr>
 	</form>
</table>




		
