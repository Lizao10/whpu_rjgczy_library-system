<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.lib.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理系统 - 首页</title>
<style>
    body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; margin: 0; padding: 0; }
    .navbar { background-color: #2c3e50; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    .navbar a { color: #ecf0f1; text-decoration: none; margin-left: 15px; font-size: 14px; }
    .container { padding: 30px; max-width: 1000px; margin: 0 auto; }
    .header-box { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
    .admin-panel { background: #fff; padding: 15px; border-left: 5px solid #3498db; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
    table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
    th { background-color: #3498db; color: white; padding: 15px; text-align: left; }
    td { padding: 15px; border-bottom: 1px solid #eee; color: #333; }
    tr:hover { background-color: #f1f7fd; }
    .btn { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; font-weight: bold; transition: 0.3s; display: inline-block; }
    .btn-borrow { background-color: #2ecc71; color: white; }
    .btn-edit { background-color: #f1c40f; color: white; margin: 0 5px; }
    .btn-delete { background-color: #e74c3c; color: white; }
    .btn:hover { opacity: 0.8; box-shadow: 0 2px 4px rgba(0,0,0,0.2); }
    .logout { color: #e74c3c !important; font-weight: bold; }
</style>
</head>
<body>

<div class="navbar">
    <div><strong>📚 图书馆管理系统</strong></div>
    <div>
        <span>欢迎，<%= session.getAttribute("user") %> [<%= session.getAttribute("role") %>]</span>
        <a href="MyRecords">我的借阅</a>
        <a href="LogoutServlet" class="logout">退出登录</a>
    </div>
</div>

<div class="container">
    <div class="header-box">
        <h2>全部图书资源</h2>
    </div>

    <% if("admin".equals(session.getAttribute("role"))) { %>
    <div class="admin-panel">
        <strong>管理操作：</strong>
        <a href="add_book.jsp" class="btn" style="background:#34495e; color:white;">➕ 录入新书</a>
        <a href="AllBorrows" class="btn" style="background:#34495e; color:white;">📋 查看全院借阅记录</a>
    </div>
    <% } %>

    <table>
        <tr>
            <th>ID</th><th>书籍名称</th><th>作者</th><th>当前库存</th><th>操作</th>
        </tr>
        <% 
            List<Book> list = (List<Book>)request.getAttribute("books");
            if(list != null) {
                for(Book b : list) {
        %>
        <tr>
            <td><%= b.getId() %></td>
            <td><strong><%= b.getTitle() %></strong></td>
            <td><%= b.getAuthor() %></td>
            <td><%= b.getStock() %></td>
            <td>
                <a href="BorrowServlet?id=<%= b.getId() %>" class="btn btn-borrow" onclick="return confirm('确定借阅吗？')">借阅</a>
                
                <% if("admin".equals(session.getAttribute("role"))) { %>
                    <a href="edit_book.jsp?id=<%= b.getId() %>&title=<%= b.getTitle() %>" class="btn btn-edit">修改</a>
                    <a href="DeleteServlet?id=<%= b.getId() %>" class="btn btn-delete" onclick="return confirm('确定永久删除？')">删除</a>
                <% } %>
            </td>
        </tr>
        <% } } %>
    </table>
</div>

</body>
</html>