package com.lib;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReturnServlet")
public class ReturnServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String borrowId = request.getParameter("id");
        
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false); // 开启事务

            // 1. 先查出这本书的 book_id
            int bookId = -1;
            PreparedStatement ps1 = conn.prepareStatement("SELECT book_id FROM borrows WHERE id = ?");
            ps1.setInt(1, Integer.parseInt(borrowId));
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                bookId = rs.getInt("book_id");
            }

            if (bookId != -1) {
                // 2. 增加书籍库存
                PreparedStatement ps2 = conn.prepareStatement("UPDATE books SET stock = stock + 1 WHERE id = ?");
                ps2.setInt(1, bookId);
                ps2.executeUpdate();

                // 3. 删除借阅记录
                PreparedStatement ps3 = conn.prepareStatement("DELETE FROM borrows WHERE id = ?");
                ps3.setInt(1, Integer.parseInt(borrowId));
                ps3.executeUpdate();

                conn.commit(); // 提交事务
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 还书成功后，回到“我的借阅”页面
        response.sendRedirect("MyRecords");
    }
}