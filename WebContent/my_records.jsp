<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的借阅</title>
<style>
    body { font-family: "Segoe UI", sans-serif; background-color: #f8f9fa; margin: 0; }
    .container { padding: 40px; max-width: 800px; margin: 0 auto; }
    .card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); }
    h2 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th { text-align: left; padding: 12px; border-bottom: 2px solid #eee; color: #7f8c8d; }
    td { padding: 15px; border-bottom: 1px solid #f9f9f9; }
    .btn-return { background-color: #27ae60; color: white; padding: 8px 16px; border-radius: 20px; text-decoration: none; font-size: 13px; }
    .back-link { display: inline-block; margin-top: 20px; color: #3498db; text-decoration: none; }
</style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>📖 我的借阅清单</h2>
            <table>
                <tr><th>书籍名称</th><th>借阅日期</th><th>操作</th></tr>
                <% 
                    List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("myRecords");
                    if(list == null || list.isEmpty()){
                %>
                <tr><td colspan="3" style="text-align:center; color:#999; padding:30px;">暂无借阅记录</td></tr>
                <% } else {
                    for(Map<String, String> r : list) { %>
                <tr>
                    <td><strong><%= r.get("title") %></strong></td>
                    <td><%= r.get("date") %></td>
                    <td><a href="ReturnServlet?id=<%= r.get("borrow_id") %>" class="btn-return">还书</a></td>
                </tr>
                <% } } %>
            </table>
            <a href="BookList" class="back-link">← 返回图书列表</a>
        </div>
    </div>
</body>
</html>