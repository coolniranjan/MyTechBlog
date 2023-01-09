/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.dao;

import com.tech.entity.PostDeatils;
import com.tech.entity.categories;
import java.sql.*;
import java.util.ArrayList;

public class PostCatDao {

    private Connection con;

    public PostCatDao(Connection con) {
        this.con = con;
    }

    public ArrayList<categories> cat() {
        ArrayList<categories> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String dec = rs.getString("dec");
                categories cat = new categories(cid, cname, dec);
                list.add(cat);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
    
    public boolean savePost(PostDeatils dt){
       boolean f=false;
        try {
            String query = "insert into post(pTitle,pPost,pCode,catId,userId) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, dt.getpTitle());
            pstmt.setString(2, dt.getpContent());
            pstmt.setString(3, dt.getpCode());
            pstmt.setInt(4, dt.getCid());
            pstmt.setInt(5, dt.getUid());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {      
        }
        return f;
    }
    public ArrayList<PostDeatils> getAllPost(){
        ArrayList<PostDeatils> list=new ArrayList<>();
        try {
            String s="select * from post";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(s);
            while (rs.next()) {
                int pId = rs.getInt("pId");
                String pTitle = rs.getString("pTitle");
                String pPost = rs.getString("pPost");
                String pCode=rs.getString("pCode");
                int cId=rs.getInt("catId");
                int uId=rs.getInt("userId");
                PostDeatils obj=new PostDeatils(pId, pTitle, pPost, pCode, cId, uId);
                list.add(obj);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public ArrayList<PostDeatils> getById(int cid){
        ArrayList<PostDeatils> lst=new ArrayList<>();
        try {
            
            PreparedStatement pstmt =con.prepareStatement("select * from post where catId=?");
            pstmt.setInt(1,cid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int pId = rs.getInt("pId");
                String pTitle = rs.getString("pTitle");
                String pPost = rs.getString("pPost");
                String pCode=rs.getString("pCode");
                int uId=rs.getInt("userId");
                PostDeatils obj=new PostDeatils(pId, pTitle, pPost, pCode, uId);
                lst.add(obj);
            }
        } catch (Exception e) {
            System.out.print("erropr at"+e);
        }
        return lst;
    }
    
    public PostDeatils postbyid(int id){
        PostDeatils pst=null;
        try {
            PreparedStatement pstmt =con.prepareStatement("select * from post where pId=?");
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String pTitle = rs.getString("pTitle");
                String pPost = rs.getString("pPost");
                String pCode=rs.getString("pCode");
                int catId=rs.getInt("catId");
                int uId=rs.getInt("userId");
                pst=new PostDeatils(pTitle, pPost, pCode,catId, uId);
                
            }
        } catch (Exception e) {
        }
        
        return pst;
    }
}
