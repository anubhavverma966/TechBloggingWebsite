/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = null;
        
        try {
            String query= "select * from categories";
            Statement st= this.con.createStatement();
            ResultSet set= st.executeQuery(query);
            
            while(set.next()){
                int cid= set.getInt("cid");
                String cname= set.getString("cname");
                String description= set.getString("description");
                String pic= set.getString("pic");
                
                Category c=new Category(cid, cname, description, pic);
                list.add(c);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    public boolean savePost(Post p){
        boolean f= false;
        try {
            String q="insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt= con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f=true;            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
