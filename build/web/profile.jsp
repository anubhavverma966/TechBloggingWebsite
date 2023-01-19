<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.util.ArrayList" %>
<%@page errorPage="error_page.jsp" %>

<% 

User user= (User)session.getAttribute("currentUser");
if(user== null){
response.sendRedirect("login_page.jsp");

}

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.banner-background{
			clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 65% 98%, 24% 94%, 0 98%, 0 0);
		}
                
                body{
                    background: url(image/blog.jpg);
                    background-size: cover;
                    background-attachment: fixed; 
                }
	</style>
    </head>
    <body>
        
        <!-- navbar -->
       <nav class="navbar navbar-expand-lg navbar-dark primary-color">
	  <a class="navbar-brand" href="index.jsp"><span class="fa fa-wpforms"></span>  Tech Bloging</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="profile.jsp"><span class="fa fa-paste"></span> Blog page <span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <span class="fa fa-navicon"></span> Categories
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          
	          <%
                     PostDao d1= new PostDao(ConnectionProvider.getConnection());
                     ArrayList<Category> list1=d1.getAllCategories();
                     int i=0;
                     for(i=0; i<list1.size()-1; i++){
                     %>
                         
                     <a class="dropdown-item c-link-1 " onclick="getPosts1(<%= list1.get(i).getCid() %>, <%= i %>)" href="#"><%= list1.get(i).getName() %></a>
                     <%
                      }
                     %>
                    
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item c-link-1" onclick="getPosts1(<%= list1.get(i).getCid() %>, <%= i %>)" href="#"><%= list1.get(i).getName() %></a>
	        
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact Us</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-modal"><span class="fa fa-paper-plane-o"></span> Add Posts</a>
	      </li>
	      
	      
	      
	    </ul>
              <ul class="navbar-nav mr-right">
                  <li class="nav-item">
                      <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                  </li>
              </ul>
	  </div>
        </nav>
                  
                  <!-- navbar ends -->
                  
                  
                                            <%
                                            Message m=(Message)session.getAttribute("msg");
                                            if(m!=null){
                                            %>
                                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                                <%= m.getContent()%>
                                            </div>
                                            <%
                                                session.removeAttribute("msg");
                                                }
                                            %>
                                           
                                            
        <!--main body of the page-->
        
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-3">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, 0)" class="c-link list-group-item list-group-item-action active">
                              All Posts
                            </a>
                            <!--categories-->
                            
                            <%
                                int j=1;
                                for(Category cc:list1){
                            %>
                                
                               <a href="#" onclick="getPosts(<%= cc.getCid() %>, <%= j %>)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                                
                            <%
                                j++;
                                }
                            %>
                            
                            
                            
                        </div>
                    </div>
                    <!--second column-->
                    <div class="col-md-9">
                        <!--posts-->
                        <div class="conatiner text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-3">Loading...</h3>
                        </div>
                        <div class="container-fluid"  id="post-container">

                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </main>
        
        <!--main body ends-->
        
        <!-- Profile modal -->
        

        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header primary-color text-white">
                <h5 class="modal-title" id="exampleModalLabel">TechBloging</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="conatiner text-center">
                      <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px;">
                      <br>
                      <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                      
                      <!-- details -->
                    
                      <div id="profile-details">
                        <table class="table">

                          <tbody>
                            <tr>
                              <th scope="row">ID: </th>
                              <td><%= user.getId()%></td>

                            </tr>
                            <tr>
                              <th scope="row">Email: </th>
                              <td><%= user.getEmail()%></td>

                            </tr>
                            <tr>
                              <th scope="row">Gender: </th>
                              <td><%= user.getGender().toUpperCase()%></td>

                            </tr>
                            <tr>
                              <th scope="row">Status: </th>
                              <td><%= user.getAbout()%></td>

                            </tr>
                            <tr>
                              <th scope="row">Registered On: </th>
                              <td><%= user.getDateTime().toString()%></td>

                            </tr>
                          </tbody>
                        </table>
                      </div>
                              
                        <!-- profile editing -->
                        
                        <div id="profile-edit" style="display:none;">
                            <h3 class="mt-2">Edit Carefully</h3>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID: </td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email: </td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name: </td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password: </td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>About: </td>
                                        <td>
                                            <textarea rows="4" class="form-control" name="user_about"><%= user.getAbout()%>
                                            </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Profile Pic:</td>
                                        <td>
                                            <input type="file" name="profile_pic" class="form-control">
                                        </td>
                                    </tr>
                                    
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>
                        
                              
                    </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
              </div>
            </div>
          </div>
        </div>
                                            
                                            
        <!-- add Post modal -->
        
        


        <!-- Modal -->
        <div class="modal fade" id="add-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Provide the Blog Details...</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                  <form id="add-post-form" action="AddPostServlet" method="POST">
                      
                      <div class="form-group">
                          <select name="cid" class="form-control">
                              <option selected disabled>---Select Category---</option>
                              <%
                                  PostDao postd= new PostDao(ConnectionProvider.getConnection());
                                  ArrayList<Category> list= postd.getAllCategories();
                                  for(Category c:list){
                                  
                              %>
                                  
                                  <option value="<%= c.getCid() %>"><%= c.getName()%></option>
                                  
                              <%
                                  }
                              %>
                              
                             
                             
                          </select>
                      </div>
                      <div class="form-group">
                          <input name="pTitle" type="text" placeholder="Enter Blog Title" class="form-control">
                      </div>
                      <div class="form-group">
                          <textarea name="pContent" placeholder="Enter Your Content" style="height: 200px;" class="form-control"></textarea>
                      </div>
                      <div class="form-group">
                          <textarea name="pCode" placeholder="Enter Your Code" style="height: 200px;" class="form-control"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Select Your Pic</label>
                          <br>
                          <input name="pic" type="file">
                      </div>
                      
                      <div class="container text-center">
                          <button type="submit" class="btn btn-outline-primary">Post</button>
                      </div>
                  </form>
                  
              </div>
              
            </div>
          </div>
        </div>
        
        <!--end of post modal-->
        
        
        <!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
        <script>
            $(document).ready(function(){
                let editStatus= false;
                $('#edit-profile-button').click(function(){
                   if(editStatus === false){
                        $('#profile-details').hide()
                    
                        $('#profile-edit').show()
                        editStatus=true;
                        $(this).text("Back")
                   }
                   else{
                        $('#profile-details').show()
                    
                        $('#profile-edit').hide()
                        editStatus=false;
                        $(this).text("Edit")
                   }
                })
            });
        </script>
        
        <!--now add post js-->
        
        <script>
            $(document).ready(function(e){
                $('#add-post-form').on("submit", function(event){
                    event.preventDefault();
                    
                    console.log("you have clicked submitted");
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR){
                            console.log(data);
                            if(data.trim()==='done'){
                                swal("Good job!", "Saved Successfully", "success");
                            }
                            else{
                                swal("Error", "Something Went Wrong! Try Again...", "error");
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            swal("Error", "Something Went Wrong! Try Again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        <!--loading post using ajax-->
        
        <script>
            
            function getPosts(catId, i){
                
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active')
                $(".c-link-1").removeClass('active')
                
                
                if(i==0){
                 $.ajax({
                    url: "load_posts.jsp",
                    data: {cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $('.c-link').eq(i).addClass('active')
                        
                    }
                 })
                }
                else{
                 $.ajax({
                    url: "load_posts.jsp",
                    data: {cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $('.c-link').eq(i).addClass('active')
                        i--
                        $('.c-link-1').eq(i).addClass('active')
                    }
                 })
                }
            }
            
            function getPosts1(catId, i){
                
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active')
                $(".c-link-1").removeClass('active')
                
                 $.ajax({
                    url: "load_posts.jsp",
                    data: {cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $('.c-link-1').eq(i).addClass('active')
                        i++
                        $('.c-link').eq(i).addClass('active')
                        
                    }
                })
            }
            
            $(document).ready(function (e){
                getPosts(0, 0)
            })
            
            
        </script>
    </body>
</html>
