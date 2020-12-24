class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # 投稿に紐づいたコメントを作成
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      ActionCable.server.broadcast 'message_channel', content: @comment, user: @comment.user,
                                                      date: @comment.created_at.to_s(:datetime_jp), id: @comment.id, post: @comment.post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    ActionCable.server.broadcast 'delete_channel', id: @comment.id if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id).merge(user_id: current_user.id)
  end
end
