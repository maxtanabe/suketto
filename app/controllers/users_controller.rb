class UsersController < ApplicationController
  before_action :jugment_user, only:[:edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  
  end

  private

  def jugment_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end

end