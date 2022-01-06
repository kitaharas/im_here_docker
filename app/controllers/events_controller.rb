class EventsController < ApplicationController

  def genre
    @genre = Genre.all
    @event = Event.all
  end

  def feel
    @feel = Feel.all
    @event = Event.all
  end

end

