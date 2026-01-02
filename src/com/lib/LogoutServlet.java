package com.lib;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 获取当前 session
        HttpSession session = request.getSession(false);
        if (session != null) {
            // 2. 销毁 session
            session.invalidate();
        }
        // 3. 重定向到登录页面
        response.sendRedirect("login.jsp");
    }
}