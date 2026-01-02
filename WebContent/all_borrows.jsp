<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<head><title>全院借阅情况</title></head>
<body>
    <h2>管理员：全院借阅记录</h2>
    <table border="1" width="80%">
        <tr><th>借阅人</th><th>书籍名称</th><th>借阅日期</th></tr>
        <% 
            List<Map<String, String>> records = (List<Map<String, String>>)request.getAttribute("allRecords");
            if(records != null) {
                for(Map<String, String> r : records) {
        %>
        <tr>
            <td><%= r.get("user") %></td>
            <td><%= r.get("book") %></td>
            <td><%= r.get("date") %></td>
        </tr>
        <% } } %>
    </table>
    <br><a href="BookList">返回首页</a>
</body>
</html>