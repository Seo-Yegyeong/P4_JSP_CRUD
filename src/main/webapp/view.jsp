<%--
  Created by IntelliJ IDEA.
  User: Lab
  Date: 2022-11-25
  Time: 오후 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.bean.BoardVO, com.example.dao.BoardDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지 세부사항</title>
    <link rel="stylesheet" href="board.css">
</head>
<body>
<%
    BoardDAO boardDAO = new BoardDAO();
    String seq=request.getParameter("seq");
    BoardVO u = boardDAO.getBoard(Integer.parseInt(seq));
    request.setAttribute("vo", u);
%>
    <h1>공지 상세보기</h1>
    <table id="edit">
        <tr>
            <td>Category</td><td>${vo.getCategory()}</td>
        </tr>
        <tr>
            <td>Title</td><td>${vo.getTitle()}</td>
        </tr>
        <tr>
            <td>Writer</td><td>${vo.getWriter()}</td>
        </tr>
        <tr>
            <td>Content</td><td>${vo.getContent()}</td>
        </tr>
        <tr>
            <td>write time</td><td>${vo.getRegdate()}</td>
        </tr>
        <tr>
            <td>Photo</td>
            <td><c:if test="${vo.getPhoto() ne ''}"><br/>
                <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"/>
            </c:if></td>
        </tr>
    </table>
    <button type="button" onclick="history.back()">뒤로 가기</button>
    <button type="button" onclick="location.href='editForm.jsp?id=${vo.getSid()}'">수정하기</button>
</body>
</html>
