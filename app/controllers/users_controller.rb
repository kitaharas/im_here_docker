class UsersController < ApplicationController

  include RelationshipsHelper

  before_action :login_check, {only: [:edit, :update, :show, :destroy]}

  def show
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
  end

  def show_our
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
    @users = User.all
  end

  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    p "-------------------"
    p params
    p "-------------------"
    @user = User.new(user_params)
    @user.image_name = "default_user.jpg"
    p "-------------------"
    p @user
    p "-------------------"
    respond_result(@user)
  
  end

  def edit
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless current_user.id == @user.id

  end

  def update

    @user = User.find(params[:id])
    p "------"
    p @user
    p "------"
    if params[:user][:image_name]
      p "------"
      p "うんち"
      p "------"
      @user.image_name="#{@user.id}.jpg"
      image = params[:user][:image_name]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    redirect_to root_path unless current_user.id == @user.id
    p "------"
    p @user
    p "------"
    if @user.update(params.require(:user).permit(:comment))
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

    def user_comment
      params.require(:user).permit(:comment)
    end



end
