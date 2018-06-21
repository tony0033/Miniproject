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
<H3>전체 검색 결과</H3>
<hr>
<table border = "1">
<tr class="t1">
<td> id</td>
<td> 투표자 이름 </td>
<td> 투표 내용 </td>
<td> 투표 날짜 </td>
</tr>

<%
ArrayList<VoteDTO> list = dao.selectAll();
for(int i = 0; i<list.size(); i++){
	VoteDTO dto = list.get(i);
	%>
	<tr class = "t2">
	<td><%= dto.getVoteId() %></td>
	<td><%= dto.getVoteName() %></td>
	<td><%= dto.getVoteContent() %></td>
	<td><%= dto.getVoteDate() %></td>
	</tr>
	<%
	}
%>
</table>
<hr>
<a href="Subinput.html">메인 페이지로 </a>
</body>
</html>