class SessionsController < ApplicationController
  # before_action :set_user, only: [:create]
  include AjaxHelper 
  # def new
  # end

  def create

    p "============="
    p params
    p "============="
    # @user = User.new(name: params[:user])
    # respond_result(@user)
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password]) 
      log_in user
      respond_to do |format|
        format.json { render json: {message: "success"} }
      end
    else
      respond_to do |format|
        format.json { render json: {message: "error"} }
          
          # user.errors.full_messages} }
      end
    end

    #   respond_to do |format|
    #     format.json { render json: {user: data} }
    #   end
    #   else
    #     respond_to do |format|
    #       format.json { render json: {error: data.errors.full_messages} }
    #     end
    #   end
    # end

  end



    # user = User.find_by(email: params[:session][:email].downcase)
    # if user && user.authenticate(params[:session][:password])
      
      
     
  #     redirect_to root_path
  #   else
  #     p "あれれ？"
  #     @error_message = "メールアドレスまたはパスワードが間違っています"
  #     redirect_to root_path
  #   end
  # end

  def destroy
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
