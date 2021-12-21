class EventsController < ApplicationController

  def genre
    @random = Event.where(ganre_id: 1).order("RANDOM()").limit(6)
  end

end

