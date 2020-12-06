$("#comments_area").html("<%= (render 'app/views/comments/index', { comments: @comment.post.comments }) %>")
$("textarea").val('')