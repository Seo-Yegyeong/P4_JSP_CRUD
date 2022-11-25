<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<link rel="stylesheet" href="board.css">
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<h1>Edit Form</h1>
<form action="editAction.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="${vo.getSeq()}"/>
<table id="edit">
<tr><td>Category:</td><td><input type="text" name="category" value="${vo.getCategory()}"/></td></tr>
<tr><td>Title:</td><td><input type="text" name="title" value="${vo.getTitle()}"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer" value="${vo.getWriter()}" /></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content">${vo.getContent()}</textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>