package com.lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    // 数据库配置信息，请确保你的密码正确
    private static final String URL = "jdbc:mysql://localhost:3306/library_db?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
    private static final String USER = "root";
    private static final String PWD = "15171346655zzP"; // 这里改成你的数据库密码

    public static Connection getConnection() throws Exception {
        // 1. 加载驱动程序
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 2. 获取连接对象
        return DriverManager.getConnection(URL, USER, PWD);
    }
}