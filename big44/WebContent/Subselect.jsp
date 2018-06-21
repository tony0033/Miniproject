<%@page import="bean.VoteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="dao" class="bean.VoteDAO"/>
<%
String id = request.getParameter("voteId");
VoteDTO dto = dao.select(id);
%>
<H3><%=dto.getVoteId() %>님의 검색 결과</H3>
<hr>

<form action = "Subupdateall.jsp">
<table border = "1">
<tr class ="t1">
<td> id</td>
<td> 투표자 이름 </td>
<td> 투표 내용 </td>
<td> 투표 날짜 </td>
</tr>
	<tr>
	<td><input type = "text" name = "voteId" value= "<%= dto.getVoteId() %>" readonly="readonly"></td>
	<td><input type = "text" name = "voteName" value= "<%= dto.getVoteName() %>"></td>
	<td><input type = "text" name = "voteContent" value= "<%= dto.getVoteContent() %>"></td>
	<td><input type = "text" name = "voteDate" value= "<%= dto.getVoteDate() %>"></td>
	</tr>
</table>
<input type="submit" value = "수정하기"> 
</form>
<%
String s = request.getParameter("update");
if(s==null){
	
}
else {
	out.print("<Hr><h3>수정이 완료되었습니다.</h3>");
}
	
	%>
	<hr>
	<a href="Subinput.html">메인 페이지로 </a>
</body>
</html>