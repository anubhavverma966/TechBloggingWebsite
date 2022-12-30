/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author hp
 */
public class Category {
    
    private int cid;
    private String name;
    private String description;
    private String pic;

    public Category(int cid, String name, String description, String pic) {
        this.cid = cid;
        this.name = name;
        this.description = description;
        this.pic = pic;
    }

    public Category() {
    }

    public Category(String name, String description, String pic) {
        this.name = name;
        this.description = description;
        this.pic = pic;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
    
    
}
