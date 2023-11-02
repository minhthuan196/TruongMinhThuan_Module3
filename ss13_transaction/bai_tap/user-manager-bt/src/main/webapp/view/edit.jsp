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
    <a href="users?action=users">List All Users</a>
</h2>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>
            <h2>
                Edit User
            </h2>
        </caption>
        <c:if test="${user != null}">
            <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
        </c:if>
        <tr>
            <th>User Name:</th>
            <td>
                <input type="text" name="name" size="45"
                       value="<c:out value='${user.name}' />"
                />
            </td>
        </tr>
        <tr>
            <th>User Email:</th>
            <td>
                <input type="text" name="email" size="45"
                       value="<c:out value='${user.email}' />"
                />
            </td>
        </tr>
        <tr>
            <th>Country:</th>
            <td>
                <input type="text" name="country" size="15"
                       value="<c:out value='${user.country}' />"
                />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>