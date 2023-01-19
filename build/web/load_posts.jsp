<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>

<div class="row">
<%
    
    User uuu= (User)session.getAttribute("currentUser");
    Thread.sleep(200);
    PostDao d= new PostDao(ConnectionProvider.getConnection());
    
    int cid= Integer.parseInt(request.getParameter("cid"));
    List<Post> posts= new ArrayList<>();
    if(cid==0){
        posts= d.getAllPosts();
    }else{
        posts= d.getPostByCatId(cid);
    }
    
    if(posts.size()==0){
        out.println("<h3 class='display-3 text-center'>No Posts available in this category...</h3>");
        return;
    }
    int i=0;
    for(Post p: posts){
    %>

    <div class="col-md-6 mt-3">
        <div class="card">
            
            <img class="card-img-top " src="blog_pics/<%= p.getpPic()%>" alt="Blog Image" style=" height: 300px">
            <div class="card-body">
                <b><%= p.getpTitle()  %></b>
                <p><%= p.getpContent() %></p>
                
            </div>
                <div class="card-footer primary-color text-center">
                    <%
                    LikeDao ld= new LikeDao(ConnectionProvider.getConnection());
                    %>

                    <a href="#!" onclick="doLike1(<%= p.getPid()%>, <%= uuu.getId()%>, <%= i%>)"  class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>

                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm"> Read More</a>

                    <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span></a>
                </div>
        </div>
    </div>  
    
<%
    i++;
    }

%>

</div>