<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.util.*" %>

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
                         
                      <a class="dropdown-item" href="#"><%= list1.get(i).getName() %></a>
                     <%
                      }
                     %>
                    
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#"><%= list1.get(i).getName() %></a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact Us</a>
	      </li>
              
	      <li class="nav-item">
	        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Signup</a>
	      </li>
	      
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
	    </form>
	  </div>
  </nav>