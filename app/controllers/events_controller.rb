class EventsController < ApplicationController

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @events = Event.search(params[:search])
  end


  def genre
    @genre = Genre.all
    # @event = Event.all
  end

  def feel
    @feel = Feel.all
    @event = Event.all
  end

  # def new
  # end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      respond_to do |format|
        format.json { render json: {message: "success", id:@event.id } }
      end
    else
      respond_to do |format|
        format.json { render json: {error: @event.errors.full_messages} }
      end
    end

  end

  def show
    # redirect_to root_path unless current_user.id == @user.id
    @event = Event.find(params[:id])
  end

  def edit
    # redirect_to root_path unless current_user.id == @user.id
    @event = Event.find(params[:id])
  end

  def update
    # redirect_to root_path unless current_user.id == @user.id
    @event = Event.find(params[:id])
    p "------"
    p @event
    p "------"
    if @event.update(update_params)
    p "------"
    p @event
    p "------"
    redirect_to eventpage_path
    else
    render("events/edit")
    end
  end

  def delete
  end


  private
    def event_params
      params.permit(:event_title,:genre_id,:feel_id,:date,:content,:place,:people)
    end

    def update_params
      params.fetch(:event,{}).permit(:event_image_name,:content,:event_title)
    end


end

