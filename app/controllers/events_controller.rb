class EventsController < ApplicationController

  def genre
    @random = Event.order("RANDOM()").limit(6)
  end

end

