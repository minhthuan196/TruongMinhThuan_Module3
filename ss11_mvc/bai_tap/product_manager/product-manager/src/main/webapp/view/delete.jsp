<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/31/2023
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1>Delete product</h1>
<p>
  <a href="/product">Back to product list</a>
</p>
<form method="post">
  <h3>Are you sure?</h3>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Name: </td>
        <td>${product.name}</td>
      </tr>
      <tr>
        <td>Price: </td>
        <td>${product.price}</td>
      </tr>
      <tr>
        <td>Note: </td>
        <td>${product.note}</td>
      </tr>
      <tr>
        <td>Manufacturer: </td>
        <td>${product.manufacturer}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete product"></td>
        <td><a href="/product">Back to product list</a></td>
      </tr>
    </table>
</form>
</body>
</html>
