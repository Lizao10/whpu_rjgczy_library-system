<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理系统 - 登录</title>
<style>
    body { font-family: "Microsoft YaHei", sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    .login-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 300px; }
    h2 { text-align: center; color: #333; }
    input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
    .btn-login { width: 100%; background-color: #4CAF50; color: white; padding: 10px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
    .btn-register { width: 100%; background-color: #2196F3; color: white; padding: 10px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 10px; text-decoration: none; display: inline-block; text-align: center; }
    .btn-login:hover { background-color: #45a049; }
    .btn-register:hover { background-color: #0b7dda; }
</style>
</head>
<body>
    <div class="login-container">
        <h2>系统登录</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="用户名" required>
            <input type="password" name="password" placeholder="密码" required>
            <button type="submit" class="btn-login">立即登录</button>
        </form>
        <a href="register.jsp" class="btn-register">还没有账号？点击注册</a>
    </div>
    
</body>
</html>