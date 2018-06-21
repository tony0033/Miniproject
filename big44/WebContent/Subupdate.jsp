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
<jsp:useBean id="dto" class="bean.VoteDTO">
<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<jsp:useBean id="dao" class="bean.VoteDAO"/>

<% 
String s = request.getParameter("s");
dao.update(dto, s);
%>
<h3><%= dto.getVoteId() %>님의 수정이 완료되었습니다.!</h3>
<hr>
<a href="Subinput.html">메인 페이지로 </a>
</body>
</html>