class SchedulesController < ApplicationController
  before_action :set_post
  
  def create
    if @event.user_id != current_user.id 
      @schedule = Schedule.create(user_id: current_user.id, event_id: @event.id)
      visited = @event.user_id
      @schedule.create_notification_schedule!(current_user,visited, @schedule.id)
    end

    redirect_to request.referer
  end
  # お気に入り削除
  def destroy
    @schedule = Schedule.find_by(user_id: current_user.id, event_id: @event.id)
    @schedule.destroy
    redirect_to request.referer
  end

  private
  def set_post
    @event = Event.find(params[:event_id])
  end
end
