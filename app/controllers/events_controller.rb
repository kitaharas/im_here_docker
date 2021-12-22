class EventsController < ApplicationController

  def genre
    @ganre = Ganre.all
    @event = Event.all
    # where(ganre_id: 1).order("RANDOM()").limit(6)
  end

  def feel
    @feel = Feel.all
    @event = Event.all
  end

end

