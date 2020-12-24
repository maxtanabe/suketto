class ThanksController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @thank = Thank.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @thank = @post.thanks.build(thank_params)
    @thank.user_id = current_user.id
    if @thank.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def thank_params
    params.require(:thank).permit(:title, :image, :post_id, :user_id).merge(user_id: current_user.id)
  end
end
