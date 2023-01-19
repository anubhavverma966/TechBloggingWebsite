function doLike(pid, uid){
    console.log(pid + "," + uid)
    
    const d= {
        uid: uid,
        pid: pid,
        operation: 'like'
    }
    
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function(data, textStatus, jqXHR){
            console.log(data);
            if(data.trim()== 'true'){
                let c= $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }
            else if(data.trim()=='deleted'){
                let c= $(".like-counter").html();
                c--;
                $('.like-counter').html(c);
            }
        },
        error: function(jqXHR, textStatus, errorThrown){
            console.log(data)
        }
    })
}

function doLike1(pid, uid, i){
    console.log(pid + "," + uid)
    
    const d= {
        uid: uid,
        pid: pid,
        operation: 'like'
    }
    
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function(data, textStatus, jqXHR){
            console.log(data);
            if(data.trim()== 'true'){
                let c= $(".like-counter").eq(i).html();
                c++;
                $(".like-counter").eq(i).html(c);
            }
            else if(data.trim()=='deleted'){
                let c= $(".like-counter").eq(i).html();

                $(".like-counter").eq(i).html(c-1);
            }
        },
        error: function(jqXHR, textStatus, errorThrown){
            console.log(data)
        }
    })
}

