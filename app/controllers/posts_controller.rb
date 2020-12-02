class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :price, :video).merge(user_id: current_user.id)
  end

end
