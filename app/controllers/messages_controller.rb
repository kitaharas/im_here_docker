class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    @user = (@room.users.where.not(id: current_user.id).to_a)[0]
  end

  def create


    p "-----------------"
    p params[:message][:to_user_id]
    p "-----------------"
    # @to = User.find(params[:message][:to_user_id])
    if params[:message][:room]
      p "-----------------"
      p "ajapa"
      p "-----------------"
      @exist_room = Room.find(params[:message][:room])
      @message = @exist_room.messages.build(message_params)
      @message.user_id = session[:user_id]
      p @message
    else
      p "-----------------"
      p "ルームできる？"
      p "-----------------"
      
      @exist_room = room_check(params[:message][:user_id], params[:message][:to_user_id])
      if !@exist_room
        @room = Room.create(rooms_params)
      end
      @message = Message.new(message_params)
      @message.room_id = @room.id
    end

    if @message.save
      @message.create_notification_message!(current_user, @message.id)

      if @exist_room
        redirect_to exist_room_path(@exist_room.id)
      else
        redirect_to exist_room_path(@room.id)
      end
    else
      @user = User.find(session[:user_id])
      @to = User.find(params[:message][:to_user_id])
      @room = room_check(@user, @to)
      @messages = Message.where(room_id: @room.id)
      p "-------------"
      p @exist_room.id
      p "これはルームid"
      p "-------------"
      render "rooms/show" 
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id,:image_name)
    end

    def rooms_params
      params.require(:message).permit(:user_id, :to_user_id)
    end

end
