<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/31/2023
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin-right: 20px;
            margin-left: 20px;
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
<h1>Product By ${name}</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Note</td>
        <td>Manufacturer</td>
        <td>Detail</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.note}</td>
            <td>${product.manufacturer}</td>
            <td><a href="/product?action=detail&id=${product.getId()}">detail</a></td>
            <td><a href="/product?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
