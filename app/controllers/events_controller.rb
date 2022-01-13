class EventsController < ApplicationController

  def genre
    @genre = Genre.all
    @event = Event.all
  end

  def feel
    @feel = Feel.all
    @event = Event.all
  end

  # def new
  # end

  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.json { render json: {message: "success"} }
      end
    else
      respond_to do |format|
        format.json { render json: {error: @event.errors.full_messages} }
      end
    end

  end

  # def create
  #   Evemt.create!(event_params)
  #   render :complete
  # end

  private
    def event_params
      params.permit(:event_title,:genre_id,:feel_id,:date,:content,:place,:people)
    end


end

