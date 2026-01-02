package com.lib;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BorrowRecords")
public class BorrowRecordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user");
        List<Map<String, String>> records = new ArrayList<>();
        
        try (Connection conn = DBUtil.getConnection()) {
            // 关联查询书名
            String sql = "SELECT b.id as borrow_id, bk.title, b.borrow_date FROM borrows b JOIN books bk ON b.book_id = bk.id WHERE b.username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", rs.getString("borrow_id"));
                map.put("title", rs.getString("title"));
                map.put("date", rs.getString("borrow_date"));
                records.add(map);
            }
        } catch (Exception e) { e.printStackTrace(); }
        
        request.setAttribute("records", records);
        request.getRequestDispatcher("records.jsp").forward(request, response);
    }
}