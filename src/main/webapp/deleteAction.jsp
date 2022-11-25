<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String seq = request.getParameter("seq");
	if (seq != ""){
		int id = Integer.parseInt(seq);
		BoardDAO boardDAO = new BoardDAO();

		String filename = BoardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile((HttpServletRequest) request, filename);

		boardDAO.deleteBoard(id);

		//delete photo

	}
	response.sendRedirect("post_list.jsp");
%>