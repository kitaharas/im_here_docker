class RoomsController < ApplicationController

  def index
  end

  def new
  end

  def show
    

    @user = User.find(session[:user_id])
    p "------------------"
    p @user
    p "------------------"
    if params[:to_user]
      p "------------------"
      p "user"
      p "------------------"
      @to   = User.find(params[:to_user])
      @room = room_check(@user, @to)
    end
    if params[:room_id]
      p "------------------"
      p "room"
      p "------------------"
      @room = Room.find(params[:room_id])
      @to   = User.find(@room.to_user_id)
    end
    if @room
      p "========="
      p @room.id
      p "========="
      if @room.user_id == current_user.id
        id = @room.to_user_id
        @to = User.find(id)
      else
        id = @room.user_id
        @to = User.find(id)
      end
      @messages = Message.where(room_id: @room.id)
      # メッセージズが出てる
    end
  end

  def new
    @room = Room.new
  end

  def create
    p "-------------"
    p room_params
    p RoomUser.find_by(user_id :room_params)
    p "-------------"
    # @room = Room.new(room_params)
    # @room.save
    # redirect_to room_messages_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    # redirect_to room_messages_path
  end

    private
      def room_params
        params.permit(user_ids: [])
      end

end
