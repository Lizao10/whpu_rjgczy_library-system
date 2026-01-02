<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书信息维护</title>
<style>
    body { font-family: "Segoe UI", sans-serif; background-color: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    .form-card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); width: 350px; }
    h2 { text-align: center; color: #2c3e50; margin-bottom: 30px; }
    .input-group { margin-bottom: 20px; }
    .input-group label { display: block; margin-bottom: 8px; color: #34495e; font-weight: bold; }
    input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; }
    input:focus { border-color: #3498db; outline: none; box-shadow: 0 0 5px rgba(52,152,219,0.3); }
    .btn-submit { width: 100%; background: #3498db; color: white; padding: 12px; border: none; border-radius: 6px; cursor: pointer; font-size: 16px; transition: 0.3s; }
    .btn-submit:hover { background: #2980b9; }
    .cancel-link { display: block; text-align: center; margin-top: 15px; color: #95a5a6; text-decoration: none; font-size: 14px; }
</style>
</head>
<body>
    <div class="form-card">
        <h2>录入新书</h2>
        <form action="AddBookServlet" method="post">
            <div class="input-group">
                <label>书名</label>
                <input type="text" name="title" required placeholder="请输入书名">
            </div>
            <div class="input-group">
                <label>作者</label>
                <input type="text" name="author" required placeholder="请输入作者">
            </div>
            <div class="input-group">
                <label>库存数量</label>
                <input type="number" name="stock" value="1" min="1" required>
            </div>
            <button type="submit" class="btn-submit">确认提交</button>
            <a href="BookList" class="cancel-link">取消并返回</a>
        </form>
    </div>
</body>
</html>