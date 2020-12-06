class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :jugment_user, only:[:edit]

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(@post.user.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
       @post.destroy
    end
    redirect_to user_path(@post.user.id)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:title, :price, :video).merge(user_id: current_user.id)
  end

  def jugment_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to root_path
    end
  end

end
