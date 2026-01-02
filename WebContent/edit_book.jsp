<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改图书信息 - 后台管理</title>
<style>
    /* 全局背景优化 */
    body { 
        font-family: "Segoe UI", "PingFang SC", sans-serif; 
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); 
        display: flex; 
        justify-content: center; 
        align-items: center; 
        height: 100vh; 
        margin: 0; 
    }

    /* 编辑卡片容器 */
    .edit-card { 
        background: white; 
        padding: 40px; 
        border-radius: 15px; 
        box-shadow: 0 10px 30px rgba(0,0,0,0.15); 
        width: 380px; 
        position: relative;
        overflow: hidden;
    }

    /* 左侧修饰条 */
    .edit-card::before {
        content: "";
        position: absolute;
        top: 0; left: 0; width: 6px; height: 100%;
        background: #f1c40f; /* 橙黄色代表“修改/编辑”状态 */
    }

    h2 { 
        text-align: center; 
        color: #2c3e50; 
        margin-top: 0;
        margin-bottom: 25px;
        font-size: 24px;
    }

    /* 只读信息展示（展示ID） */
    .info-tag {
        background: #fdf6e3;
        border: 1px solid #f1c40f;
        color: #b58900;
        padding: 8px;
        border-radius: 4px;
        font-size: 13px;
        margin-bottom: 20px;
        text-align: center;
    }

    .input-group { margin-bottom: 18px; }
    
    .input-group label { 
        display: block; 
        margin-bottom: 8px; 
        color: #7f8c8d; 
        font-size: 14px;
        font-weight: 600;
    }

    input { 
        width: 100%; 
        padding: 12px 15px; 
        border: 2px solid #edf2f7; 
        border-radius: 8px; 
        box-sizing: border-box; 
        transition: all 0.3s ease;
        font-size: 15px;
    }

    input:focus { 
        border-color: #f1c40f; 
        outline: none; 
        background: #fffdf9;
        box-shadow: 0 0 8px rgba(241, 196, 15, 0.2); 
    }

    /* 提交按钮 */
    .btn-update { 
        width: 100%; 
        background: #f1c40f; 
        color: #fff; 
        padding: 14px; 
        border: none; 
        border-radius: 8px; 
        cursor: pointer; 
        font-size: 16px; 
        font-weight: bold;
        transition: 0.3s;
        box-shadow: 0 4px 6px rgba(241, 196, 15, 0.2);
    }

    .btn-update:hover { 
        background: #d4ac0d; 
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(241, 196, 15, 0.3);
    }

    .btn-update:active { transform: translateY(0); }

    .cancel-link { 
        display: block; 
        text-align: center; 
        margin-top: 20px; 
        color: #95a5a6; 
        text-decoration: none; 
        font-size: 14px;
        transition: 0.2s;
    }

    .cancel-link:hover { color: #7f8c8d; text-decoration: underline; }
</style>
</head>
<body>

    <div class="edit-card">
        <h2>🛠️ 编辑书籍信息</h2>
        
        <div class="info-tag">
            正在修改书籍编号: <strong><%= request.getParameter("id") %></strong>
        </div>

        <form action="UpdateBookServlet" method="post">
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
            
            <div class="input-group">
                <label>书籍名称</label>
                <input type="text" name="title" value="<%= request.getParameter("title") != null ? request.getParameter("title") : "" %>" placeholder="输入新书名" required>
            </div>

            <div class="input-group">
                <label>作者姓名</label>
                <input type="text" name="author" placeholder="输入作者姓名" required>
            </div>

            <div class="input-group">
                <label>调整库存数量</label>
                <input type="number" name="stock" min="0" placeholder="设置新库存" required>
            </div>

            <button type="submit" class="btn-update">保存更改</button>
            <a href="BookList" class="cancel-link">放弃修改，返回列表</a>
        </form>
    </div>

</body>
</html>