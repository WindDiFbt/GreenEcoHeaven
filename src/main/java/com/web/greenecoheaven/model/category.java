/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.web.greenecoheaven.model;

/**
 *
 * @author Asus
 */
public class category {

    private int category_id;
    private String name;

    public category(int category_id, String name) {
        this.category_id = category_id;
        this.name = name;
    }

    public category() {
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "category{" + "id=" + category_id + ", name=" + name + '}';
    }
}
