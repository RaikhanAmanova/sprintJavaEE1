<%@ page import="model.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: Райхан
  Date: 07.02.2024
  Time: 00:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br><br>
    <%
        Tasks tasks = (Tasks) request.getAttribute("spisok");
    %>
    ID: <span><%=tasks.getId()%></span>
    <br><br>
    Название: <span><%=tasks.getName()%></span>
    <br><br>
    Описание: <span><%=tasks.getDescription()%></span>
    <br><br>
    Крайний срок: <span><%=tasks.getDeadlineDate()%></span>
    <br><br>
    Статус: <span><%=tasks.isStatus()%></span>
    <br><br>
    <div style="display: flex">
        <div>
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Удалить
            </button>
        </div>
        <div style="margin-left: 10px">
            <a href="/home" class="btn btn-primary">
                Сохранить
            </a>
        </div>
    </div>
</div>
<!-- Modal for Удаление -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Удаление задачи</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/deleteTasks" method="post">
                <div class="modal-body">
                    <input type="hidden" name = "id" value="<%=tasks.getId()%>">
                    <h1 style="text-align: center">ARE YOU SURE?</h1>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
