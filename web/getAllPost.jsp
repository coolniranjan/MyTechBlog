<%@page import="com.tech.entity.User"%>
<%@page errorPage="error.jsp" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="com.tech.entity.User" %>
<%@page import="com.tech.entity.categories" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import="com.tech.helper.*" %>
<%@page import="com.blog.servlet.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.dao.PostCatDao"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.entity.*"%>
<div class="row">
    <%
        int id=Integer.parseInt(request.getParameter("catid"));
        PostCatDao pt=new PostCatDao(ConnectionProvider.getConnection());
        ArrayList<PostDeatils> lst=null;
        if(id==0){
            lst=pt.getAllPost();
        }
        else{    
            lst=pt.getById(id);
        }
        if(lst.size()==0){
        out.println("<h3 class='display-3 text-center'>No post in this category..</h3>");
        return;
        }
         for(PostDeatils c:lst){  
    %> 

    <div class="col-sm-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><%=c.getpTitle()%></h5>
                <p><%=c.getpContent()%></p>
                <code><%=c.getpCode()%></code>
            </div>
        </div>
            <div class="card-footer primary-background text-center">
                

                <a href="#!"  class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"></span>  </a>

                <a href="show_blog_page.jsp?post_id=<%= c.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
            </div>
    </div> 

    <%
        }
    %>
</div>


