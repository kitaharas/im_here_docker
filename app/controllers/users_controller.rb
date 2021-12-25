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
      
    else
      redirect_to "home/index"
    end

  end

  def login
    @user = User.find_by(email: params[:email],
                         password: params[:password])
    if @user
      flash[:notice] = "ログインしました"
      redirect_to "home/index"
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
