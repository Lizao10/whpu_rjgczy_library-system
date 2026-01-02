<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<body>
    <h2>我的借阅记录</h2>
    <table border="1">
        <tr><th>书名</th><th>借阅日期</th><th>操作</th></tr>
        <% 
            List<Map<String, String>> records = (List<Map<String, String>>)request.getAttribute("records");
            for(Map<String, String> r : records) {
        %>
        <tr>
            <td><%= r.get("title") %></td>
            <td><%= r.get("date") %></td>
            <td><a href="ReturnServlet?id=<%= r.get("id") %>">归还图书</a></td>
        </tr>
        <% } %>
    </table>
    <br><a href="BookList">返回图书列表</a>
</body>
</html>