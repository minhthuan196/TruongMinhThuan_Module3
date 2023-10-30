<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/30/2023
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    h1{
      text-align: center
    }
     table {
       font-family: arial, sans-serif;
       border-collapse: collapse;
       width: 100%;
     }

    td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even) {
      background-color: #dddddd;
    }
  </style>
</head>
<body>
<div>
  <h1>DANH SÁCH KHÁCH HÀNG</h1>
  <div>
    <table>
      <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
      </tr>
      <c:forEach var="customer" items="${customerList}">
        <tr>
          <td>${customer.name}</td>
          <td>${customer.dateOfBirth}</td>
          <td>${customer.address}</td>
          <td><img style="height: 100px; width: 100px" src="${customer.image}"></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>
</body>
</html>
