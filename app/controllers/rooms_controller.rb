class RoomsController < ApplicationController



  def show_message
    @user = User.find(session[:user_id])
    if params[:to_user]
      p "=============="
      p "user"
      p "=============="
      @to   = User.find(params[:to_user])
      @room = room_check(@user, @to)
    end
    if params[:room_id]
      p "=============="
      p "room"
      p "=============="
      @room = Room.find(params[:room_id])
    end
    if @room
      p "========="
      p @room.id
      p "========="
      if params[:page] == 0
        @messages = Message.where(room_id: @room.id).page(1).per(3)
      else
        @messages = Message.where(room_id: @room.id).page(params[:page]).per(3)
      end
      render json: {messages: @messages, user: @user}
    end
  end


  def show
    @message = Message.new
    @user = User.find(session[:user_id])
    p "------------------"
    p @user
    p "------------------"
    if params[:to_user]
      p "------------------"
      p "user"
      p params 
      p "------------------"
      @to   = User.find(params[:to_user])
      @room = room_check(@user, @to)
      
    end
    if params[:room_id]
      @room = Room.find(params[:room_id])
      user = User.find(@room.user_id)
      redirect_to root_path unless current_user.id == user.id
      p "------------------"
      p "roomだよ"
      p "------------------"
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
