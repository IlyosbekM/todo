<%@ page import="java.util.List" %>
<%@ page import="entity.Todo" %>
<%@ page import="Repository.TodoRepository" %>
<%
    List<Todo> todos = TodoRepository.getAllTodos();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Todo List</title>
</head>
<body>
<h1>Todo List</h1>
<ul>
    <c:forEach var="todo" items="${todos}">
        <li>${todo.getText()} - <a href="edit.jsp?id=${todo.getId()}">Edit</a> - <a href="delete?id=${todo.getId()}">Delete</a></li>
    </c:forEach>
</ul>
<a href="add.jsp">Add Todo</a>
</body>
</html>
