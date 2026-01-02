package com.lib;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取表单提交的数据
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int stock = Integer.parseInt(request.getParameter("stock"));

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE books SET title=?, author=?, stock=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setInt(3, stock);
            ps.setInt(4, id);
            ps.executeUpdate();
            
            response.sendRedirect("BookList");
        } catch (Exception e) { e.printStackTrace(); }
    }
}