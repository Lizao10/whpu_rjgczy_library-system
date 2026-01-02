package com.lib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        String bookIdStr = request.getParameter("id");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false); // 开启事务

            // 1. 更新库存：库存必须大于0
            String updateSql = "UPDATE books SET stock = stock - 1 WHERE id = ? AND stock > 0";
            PreparedStatement psUpdate = conn.prepareStatement(updateSql);
            psUpdate.setInt(1, Integer.parseInt(bookIdStr));
            int updatedRows = psUpdate.executeUpdate();

            if (updatedRows > 0) {
                // 2. 插入借阅表记录
                String insertSql = "INSERT INTO borrows (username, book_id, borrow_date) VALUES (?, ?, CURDATE())";
                PreparedStatement psInsert = conn.prepareStatement(insertSql);
                psInsert.setString(1, username);
                psInsert.setInt(2, Integer.parseInt(bookIdStr));
                psInsert.executeUpdate();

                conn.commit(); // 提交事务
                response.sendRedirect("BookList"); // 成功后刷新列表
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('库存不足！'); window.location.href='BookList';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}