<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        div {
            display: flex;
            flex-wrap: wrap;
            align-content: center;
        }

        input {
            padding: 10px;
            margin: 10px
        }

        button {
            padding: 10px;
        }
    </style>
</head>
<body>
<form action="/discount" method="post">
    <div>
        <h3>Product Description: </h3>
        <input type="text" name="description" placeholder="Product Description">
    </div>
    <div>
        <h3>List Price</h3>
        <input type="text" name="price" placeholder="List Price">
    </div>
    <div>
        <h3>Discount Percent</h3>
        <input type="text" name="discount" placeholder="Discount Percent">
    </div>
    <div>
        <button type="submit">Calculate Discount</button>
    </div>
</form>
</body>
</html>