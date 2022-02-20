class ApplicationController < ActionController::Base

  include SessionsHelper
  include NotificationsHelper

  # helper_method :unchecked_notifications
  helper_method :login_check

  before_action :set_notification
  


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

  def room_check(user, to)
    exist_room = Room.find_by(user_id: user, to_user_id: to)
    
    if !exist_room
      exist_room = Room.find_by(user_id: to, to_user_id: user)
    end

    return exist_room
  end

  private
  def set_notification
    if logged_in?()
      @notifications = Notification.where(visited_id: current_user.id)
      @notifications_check = @notifications.where(checked: 0)
      @notifications_follow = @notifications_check.where(action: "follow")
      @notifications_schedule = @notifications_check.where(action: "schedule")
      @notifications_message = @notifications_check.where(action: "message")
    end
  end
  
end

