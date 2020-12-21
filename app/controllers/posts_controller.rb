class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :jugment_user, only:[:edit]
  before_action :find_post, only:[:edit, :update, :destroy, :show, :order]

  def index
    @posts = Post.all.order("created_at DESC")
    @thanks = Thank.order("RAND()").limit(5)
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
  end

  def update
    if @post.update(post_params)
      redirect_to user_path(@post.user.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @post.user_id
       @post.destroy
    end
    redirect_to user_path(@post.user.id)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
    @thank = Thank.new
    @thanks = @post.thanks
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @post.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
      )
      PostOrder.create(post_id: params[:id])
      redirect_to root_path
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

  def find_post
    @post = Post.find(params[:id])
  end

end
