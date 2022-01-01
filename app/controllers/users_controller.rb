class UsersController < ApplicationController


  before_action :login_check, {only: [:edit, :update, :show, :destroy]}

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    p "-------------------"
    p params
    p "-------------------"
    @user = User.new(user_params)
    p "-------------------"
    p @user
    p "-------------------"
    respond_result(@user)

    # if @user.save
    #   log_in @user
    #   respond_to do |format|
    #     format.json { render json: {message: "success"} }
    #   end
    # else
    #   respond_to do |format|
    #     format.json { render json: {error: @user.errors.full_messages }
    #   end
    # end


  end



  def edit
    @user = User.find_by(id: params[:id])
  end

  def update

    @user = User.find(params[:id])
    p "------"
    p @user
    p "------"
    if @user.update(params.require(:user).permit(:comment))
    p "------"
    p @user
    p "------"
    redirect_to mypage_path
    else
    p "unko"
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
