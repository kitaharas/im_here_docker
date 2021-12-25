class SessionsController < ApplicationController
  # before_action :set_user, only: [:create]

  # def new
  # end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      
      
     
      redirect_to root_path
    else
      p "あれれ？"
      @error_message = "メールアドレスまたはパスワードが間違っています"
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

    # private

    # def set_user
    #   @user = User.find_by!(mail: session_params[:mail])
    # rescue
    #   flash.now[:danger] = t('.flash.invalid_mail')
    #   render action: 'new'
    # end

    # # 許可するパラメータ
    # def session_params
    #   params.require(:session).permit(:mail, :password)
    # end

end
