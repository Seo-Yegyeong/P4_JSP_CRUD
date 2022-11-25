<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addAction.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Category:</td>
            <td><input type="text" name="category"/></td>
        </tr>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>Writer:</td>
            <td><input type="text" name="writer"/></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"></textarea></td>
        </tr>
        <tr>
            <td>File</td>
            <td><input type="file" name="photo"></td>
        </tr>
        <tr>
            <td><a href="post_list.jsp">View All Records</a></td>
            <td content-align="right"><input type="submit" value="Add Post"/></td>
        </tr>
    </table>
</form>

</body>
</html>