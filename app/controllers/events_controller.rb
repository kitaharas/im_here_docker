class EventsController < ApplicationController

  def genre
    @genre = Genre.all
    @event = Event.all
  end

  def feel
    @feel = Feel.all
    @event = Event.all
  end

  def new

  end

  def confirm
    # @event = Event.new(event_params)
    #   respond_to do |format|
    #     format.json { render json: {message: "success"} }
    #   end
    #   else
    #     respond_to do |format|
    #       format.json { render json: {error: data.errors.full_messages} }
    #     end
    #   end
    # end

  end

  def create
    Evemt.create!(event_params)
    render :complete
  end

  private
    def event_params
      params.require(:event).permit(:event_title,:genre_id,:feel_id,:date,:content)
    end


end

