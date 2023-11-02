<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 10/31/2023
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới</h1>
<form action="/student?action=add" method="post">
<%--  <input name="id" placeholder="nhập id"><br>--%>
  <input name="name" placeholder="nhập tên"><br>
    <c:if test="${true}">
        <input checked type="radio" name="gender" value="true">Nam
    </c:if>
  <input type="radio" name="gender" value="false">Nữ<br>
  <input type="number" name="point" placeholder="nhập điểm" ><br>
    <select name="classId">
        <option value="0">--Chọn--</option>
        <option value="1">C07</option>
        <option value="2">C08</option>
        <option value=3">C09</option>
    </select><br>
    <button type="submit">Lưu</button>
</form>
</body>
</html>
