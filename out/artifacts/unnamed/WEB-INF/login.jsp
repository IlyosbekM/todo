<%@ page import="com.pdp.User" %>
<%@ page import="com.pdp.UserDAO" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String login = request.getParameter("login");
        User user = UserDAO.getUserByLogin(login);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("list.jsp");
        } else {
            out.println("Invalid login");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login</h1>
<form method="post">
    Login: <input type="text" name="login">
    <input type="submit" value="Login">
</form>
</body>
</html>
