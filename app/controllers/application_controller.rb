class ApplicationController < ActionController::Base

  include SessionsHelper

  helper_method :login_check


  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  def sign_out
    cookies.delete(:user_remember_token)
  end

  def login_check
    if current_user.nil?
      redirect_to root_url, danger: "ログインしてください"
    end
  end


  def respond_result(data)
    if data.save
      session[:user_id] = data.id
      respond_to do |format|
        format.json { render json: {message: "success"} }
      end
    else
      respond_to do |format|
        format.json { render json: {error: data.errors.full_messages} }
      end
    end
  end

  
end
