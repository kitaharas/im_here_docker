class UsersController < ApplicationController

  include RelationshipsHelper

  before_action :login_check, {only: [:edit, :update, :show, :destroy]}
  before_action :set_user_params, {only: [:show, :show_our, :following, :follower, :edit, :update,]}
  

  def show
    redirect_to root_path unless current_user.id == @user.id
  end

  def show_our
    redirect_to root_path unless current_user.id == @user.id
    @users = User.all
  end

  def show_view
    @user = User.find(params[:id])
    if current_user.id == @user.id
      redirect_to mypage_path
    end
  end

  def following
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @followers = @user.follower_user.where.not(id: current_user.id)
  end

  def create
    @user = User.new(user_params)
    # @user.image_name = "default_user.jpg"
    respond_result(@user)
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end


  def update
    redirect_to root_path unless current_user.id == @user.id
    p "------"
    p @user
    p "------"
    if @user.update(update_params)
    p "------"
    p @user
    p "------"
    redirect_to mypage_path
    else
    render("users/edit")
    end
 
  end
  

  private

    def user_params
      params.permit(:name, :email, :password,
                                  :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:comment, :image_name)
    end

    def user_comment
      params.require(:user).permit(:comment)
    end

    def set_user_params
      @user = User.find(params[:id])
    end

end
