<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>
</head>
<body>
    <h2>新用户注册</h2>
    <form action="RegisterServlet" method="post">
        用户名: <input type="text" name="username" required><br><br>
        密  码: <input type="password" name="password" required><br><br>
        <input type="submit" value="立即注册">
    </form>
    <p><a href="login.jsp">已有账号？去登录</a></p>
</body>
</html>