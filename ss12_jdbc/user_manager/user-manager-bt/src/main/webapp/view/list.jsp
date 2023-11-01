<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <style>
        body {
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
<c:import url="navbar.jsp"></c:import>
<h2>
    <a href="/users?action=create">Add New User</a>
</h2>
<form action="/users">
    <input type="text" name="action" hidden="hidden" value="search">
    <input name="country" type="text" placeholder="Enter country">
    <button type="submit">Search</button>
</form>
<a href="/users?action=increase">
    <button>Sort Increase By Name</button>
</a>
<a href="/users?action=decrease">
    <button>Sort Decrease By Name</button>
</a>
<h2>List of Users</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <a href="/users?action=edit&id=${user.id}">Edit</a>
                <a href="#" data-bs-toggle="modal" data-bs-target="#xoa1" onclick="modal(${user.id})">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="modal" tabindex="-1" id="xoa1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h5 style="text-align: center">Bạn có muốn xóa user ?</h5>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <a href="#">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Không</button>
                </a>
                <a id="id1">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Có</button>
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    function modal(id) {
        document.getElementById("id1").setAttribute("href", `/users?action=delete&id=` + id);
    }
</script>
</body>
</html>