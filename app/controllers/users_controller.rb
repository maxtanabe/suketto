class UsersController < ApplicationController
  before_action :authenticate_user!,only: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
      @card = customer.cards.first
    end
  end

  private

  def jugment_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end

end