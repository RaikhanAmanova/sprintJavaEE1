
<%@ page import="model.Tasks" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %><%--
<%@ page import="db.DBManager" %>

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
    <div style="margin-bottom: 10px">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
            +Добавить задание
        </button>
    </div>

    <table class="table">
        <thead>
            <tr>
                 <th scope="col">ID</th>
                <th scope="col">Наименование</th>
                <th scope="col">Описание</th>
                 <th scope="col">Крайний срок</th>
                <th scope="col">Выполнено</th>
                <th scope="col" width="10%">Детали</th>
            </tr>
         </thead>
    <tbody>
    <%
        ArrayList<Tasks> tasksList = DBManager.getAllTasks();
        for(Tasks tasks:tasksList){
    %>
    <tr>
        <td><%=tasks.getId()%></td>
        <td><%=tasks.getName()%></td>
        <td><%=tasks.getDescription()%></td>
        <td><%=tasks.getDeadlineDate()%></td>
        <td><%=tasks.isStatus() ? "Да" : "Нет"%></td>
        <td>
            <a href="/details?id=<%=tasks.getId()%>" class="btn btn-dark">Детали</a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
    </table>
</div>
<!-- Modal for UPDATE-->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/addTasks" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="nameField" class="form-label">Наименование: </label>
                        <input name = "name" class="form-control" type="text" id = "nameField">
                    </div>
                    <div class="mb-3">
                        <label for="descriptionField" class="form-label">Описание: </label>
                        <input name = "description" class="form-control" type="text" id = "descriptionField">
                    </div>
                    <div class="mb-3">
                        <label for="DeadlineDateField" class="form-label">Крайний срок: </label>
                        <input name = "deadlineDate" class="form-control" type="text" id = "DeadlineDateField">
                    </div>
                    <div class="mb-3">
                        <label for="StatusField" class="form-label">Статус: </label>
                        <input name = "status" class="form-control" value="true" type="checkbox" id = "StatusField">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-primary">Сохранить</button>
                    </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
