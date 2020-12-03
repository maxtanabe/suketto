class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.order("created_at DESC")
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :birth_date, :email)
  end

end