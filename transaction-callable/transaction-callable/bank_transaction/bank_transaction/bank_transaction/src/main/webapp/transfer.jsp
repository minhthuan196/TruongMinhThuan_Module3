<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 11/1/2023
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<form action="/transfer" class="w-50 mx-5" method="post">
    <h2>Thông tin chuyển khoản</h2>
    <div >
        <label for="inputPassword1" >Chủ tài khoản</label>
        <input name="accountSource" readonly value="9999999999" class="form-control" id="inputPassword1" placeholder="Password">
    </div>
    <div>
        <label for="inputPassword2" >Tài khoản thụ hưởng</label>
        <input name="accountTarget"  value="1111111111" class="form-control" id="inputPassword2" placeholder="Password">
    </div>
    <div >
        <label for="inputPassword3" >Số tiền</label>
        <input name="moneyTransfer" value="10000" class="form-control" id="inputPassword3" placeholder="Money to send">
    </div>
    <div>
        <label for="inputPassword3" >Nội dung chuyển khoản</label>
        <textarea cols="7" rows="2" name="content" value="Chanhtv chuyển khoản" class="form-control" id="inputPassword4" placeholder="Nội dụng chuyển"></textarea>
    </div>
    <div>
        <button type="submit" class="btn btn-primary mb-3">Bắt đầu chuyển</button>
    </div>
</form>
</body>
</html>
