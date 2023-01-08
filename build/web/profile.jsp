<%@page import="com.tech.entity.User"%>
<%@page errorPage="error.jsp" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="com.tech.entity.User" %>
<%@page import="com.tech.dao.PostCatDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.tech.entity.categories" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import="com.tech.helper.*" %>
<%@page import="com.blog.servlet.*" %>

<%
User user=(User)session.getAttribute("currentUser");
 if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>

    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="profile.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="	fa fa-bell-o"></span> Home<span class="sr-only">(current)</span></a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " data-toggle="modal" data-target="#exampleModalforPost"> <span class="fa fa-address-card-o"></span> Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModal"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>



                    <!--end of navbar-->

                    <!--toggle model-->

                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header primary-background text-white text-center" >
                                    <h5 class="modal-title" id="exampleModalLabel"> <%= user.getName()%></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <!--model data-->

                                    <div id="profile-details">
                                        <table class="table">

                                            <tbody>
                                                <tr>
                                                    <th scope="row"> ID :</th>
                                                    <td> <%= user.getId()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row"> Email : </th>
                                                    <td><%= user.getEmail()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Gender :</th>
                                                    <td><%= user.getGender()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Status :</th>
                                                    <td><%= user.getAbout()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Registered on :</th>
                                                    <td><%= user.getDateTime().toString()%></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!--profile edit-->
                                    <div id="profile-edit" style="display: none;">
                                        <h3 class="mt-2">Please Edit Carefully</h3>
                                        <form action="EditServlet" method="post" >
                                            <table class="table">
                                                <tr>
                                                    <td>ID :</td>
                                                    <td><%= user.getId()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Email :</td>
                                                    <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                                </tr>
                                                <tr>
                                                    <td>Name :</td>
                                                    <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                                </tr>
                                                <tr>
                                                    <td>Password :</td>
                                                    <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                                </tr>
                                                <tr>
                                                    <td>Gender :</td>
                                                    <td> <%= user.getGender().toUpperCase()%> </td>
                                                </tr>
                                                <tr>
                                                    <td>About  :</td>
                                                    <td>
                                                        <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                        </textarea>

                                                    </td>
                                                </tr>


                                            </table>

                                            <div class="container">
                                                <button type="submit" class="btn btn-outline-primary">Save</button>
                                            </div>

                                        </form>    

                                    </div>


                                </div>
                                <div class="modal-footer">

                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of toggle model-->


        <!--model for post-->

        <div class="modal fade" id="exampleModalforPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="heading">Enter Post Details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addPostForm" method="post" action="addPostServlet">

                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Categories</label>
                                <select class="form-control" id="exampleFormControlSelect1" name="cid">
                                    <option selected disabled>--select categories--</option>
                                    <%
                                     PostCatDao pt=new PostCatDao(ConnectionProvider.getConnection());
                                     ArrayList<categories> lst=pt.cat();
                                     for(categories c:lst){                                       
                                    %>
                                    <option value="<%= c.getCid() %>"><%= c.getCname() %></option>
                                    <%
                                        }
                                    %>


                                </select>
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput">Post Title</label>
                                <input name="title" type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input">
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Enter Post</label>
                                <textarea name="post" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Enter Code</label>
                                <textarea  name="code" class="form-control" id="exampleFormControlTextarea2" rows="3"></textarea>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-primary">Save Post</button>
                            </div>
                            
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of model for post-->


        <!--banner-->


        <div class="container-fluid m-0 p-0 banner-background">

            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3>Welcome to TechBlog  <%= user.getName() %></h3>
                    <p>George Owen was a professor at MIT's Department of Naval Architecture and Marine Engineering between 1915 and 1941, designing more than 200 sailing boats and commercial ships. He was also a competitive sailor and conceived the Tech Dinghy for student </p>

                </div>

            </div>
        </div>



        <!--js-->

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function ()
                {
                    if (editStatus === false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>

        <!--code for post details-->
        <script>
            $(document).ready(function (e) {
                $("#addPostForm").on("submit", function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: "addPostServlet",
                        type: "POST",
                        data: $("#addPostForm").serialize(),
                        success: function (result) {
                            if(result===("done")){
                                swal("Post save succesfully", "It's pretty, isn't it?");
                                $("#addPostForm").trigger("reset");
                                $("#heading").text("Enter Other Post");
                            }
                            else{
                                swal("Post Not save", "Enter all deatils.?");
                            }
                        },
                        processData: false
                    });
                });
            });
        </script>
    </body>
</html>
