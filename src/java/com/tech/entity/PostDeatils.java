/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.entity;

/**
 *
 * @author PC
 */
public class PostDeatils {
    private int pid;
    private String  pTitle;
    private String pContent;
    private String pCode;
    private int cid;
    private int uid;

    public PostDeatils(int pid, String pTitle, String pCode, int uid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pCode = pCode;
        this.uid = uid;
    }

    public PostDeatils(String pTitle, String pContent, String pCode) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
    }

    public PostDeatils(int pid, String pTitle, String pContent, String pCode) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
    }

    public PostDeatils(int pid, String pTitle, String pContent, String pCode, int cid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.cid = cid;
    }

    public PostDeatils(int pid, String pTitle, String pContent, String pCode, int cid, int uid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.cid = cid;
        this.uid = uid;
    }

    public PostDeatils(String pTitle, String pContent, String pCode, int cid, int uid) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.cid = cid;
        this.uid = uid;
    }
    

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
}
