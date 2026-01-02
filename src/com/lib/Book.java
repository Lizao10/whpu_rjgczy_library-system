package com.lib;

/**
 * 图书实体类，对应数据库中的 books 表
 */
public class Book {
    private int id;
    private String title;
    private String author;
    private int stock;

    // 完整的构造方法
    public Book(int id, String title, String author, int stock) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.stock = stock;
    }

    // --- 所有的 Getter 和 Setter 方法 ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
}