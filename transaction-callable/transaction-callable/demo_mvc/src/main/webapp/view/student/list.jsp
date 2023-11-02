
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<h1>Trang danh sách sinh viên</h1>

<a href="/student?action=add">Thêm mới</a>

<%-- thông báo thêm mới thành công--%>
<c:if test="${param.get('isCreated')}">
    <p style="color: red">Thêm mới thành công</p>
</c:if>

<table class="table table-stripped">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
        <th>Mã lớp</th>
        <th>Chỉnh sửa</th>
        <th>Xoá</th>
    </tr>
    <c:forEach items="${studentList}" var="student" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.name}</td>
            <c:if test="${student.gender}">
                <td>Nam</td>
            </c:if>
            <c:if test="${!student.gender}">
                <td>Nữ</td>
            </c:if>
            <td>${student.point}</td>
            <c:choose>
                <c:when test="${student.point>=8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.point>=7}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${student.point>=5}">
                    <td>Trung bình</td>
                </c:when>
                <c:otherwise>
                    <td>Yêu sắc yếu</td>
                </c:otherwise>
            </c:choose>
            <td>${student.classId}</td>
            <td>
                <button class="btn btn-primary btn-sm">Chỉnh sửa</button>
                <button type="button" onclick="deleteInfo('${student.id}','${student.name}')" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xoá
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/student?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="" name="deleteId" id="deleteId">
                    <span>Bạn có muốn xoá sinh viên : </span><span style="color: red" id="deleteName"></span>?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>

    </div>
</div>

<%--Toast--%>
<div id="toast" class="toast bg-warning position-fixed top-0 w-25" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-body">
        <p id="toast-content"> Thêm mới thành công</p>
    </div>
</div>

<script>
    function deleteInfo(id, name){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
    function displayToast(mess){
        document.getElementById("toast-content").innerText= mess;
        let toastEl = document.getElementById("toast");
        let toast = new bootstrap.Toast(toastEl);
        toast.show();
    }
    <c:if test="${param.get('isCreated')}">
      displayToast("Thêm mới thành công");
    </c:if>

    <c:if test="${param.get('isDelete')}">
    displayToast("Xoá thành công");
    </c:if>
    <c:if test="${!param.get('isDelete')}">
    displayToast("Xoá không thành công");
    </c:if>
</script>
</body>
</html>
