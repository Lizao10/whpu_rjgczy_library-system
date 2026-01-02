package com.lib;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MyRecords")
public class MyRecordsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        
        // 权限检查
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, String>> myRecords = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            // 连表查询：查出借阅记录ID、书名、借书日期
            String sql = "SELECT b.id as borrow_id, bk.title, b.borrow_date " +
                         "FROM borrows b JOIN books bk ON b.book_id = bk.id " +
                         "WHERE b.username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("borrow_id", rs.getString("borrow_id"));
                map.put("title", rs.getString("title"));
                map.put("date", rs.getString("borrow_date"));
                myRecords.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("myRecords", myRecords);
        request.getRequestDispatcher("my_records.jsp").forward(request, response);
    }
}