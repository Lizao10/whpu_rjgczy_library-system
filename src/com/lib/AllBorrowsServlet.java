package com.lib;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AllBorrows")
public class AllBorrowsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 权限校验
        HttpSession session = request.getSession();
        if (!"admin".equals(session.getAttribute("role"))) {
            response.getWriter().println("Access Denied!");
            return;
        }

        List<Map<String, String>> records = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            // 关联查询：借阅表 + 图书表
            String sql = "SELECT b.username, bk.title, b.borrow_date FROM borrows b JOIN books bk ON b.book_id = bk.id";
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("user", rs.getString("username"));
                map.put("book", rs.getString("title"));
                map.put("date", rs.getString("borrow_date"));
                records.add(map);
            }
        } catch (Exception e) { e.printStackTrace(); }
        
        request.setAttribute("allRecords", records);
        request.getRequestDispatcher("all_borrows.jsp").forward(request, response);
    }
}