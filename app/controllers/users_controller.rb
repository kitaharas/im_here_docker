class UsersController < ApplicationController

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
    if @user.save
      log_in @user
    else
      redirect_to "home/index"
    end

  end



  def edit
    @user = User.find_by(id: params[:id])
  end


    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end



end
