<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.bean.BoardVO, com.example.dao.BoardDAO, com.example.common.FileUpload"%>

<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto((HttpServletRequest) request);

	int i = boardDAO.insertBoard(u);

	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 실패 !";
%>

<script>
	alert('<%=msg%>');
	location.href='post_list.jsp';
</script>