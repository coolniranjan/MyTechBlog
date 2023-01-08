/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.entity;

public class categories {
    private int cid;
    private String cname;
    private String dec;

    public categories(String cname, String dec) {
        this.cname = cname;
        this.dec = dec;
    }

    public categories(int cid, String cname, String dec) {
        this.cid = cid;
        this.cname = cname;
        this.dec = dec;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDec() {
        return dec;
    }

    public void setDec(String dec) {
        this.dec = dec;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    
    
}
