class Schedule < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :event_id, scope: :user_id


  def create_notification_schedule!(current_user, visited,schedule_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    # temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ",
    # current_user.id, visited, room_id, 'message'])
    # if temp.blank?
    notification = current_user.active_notifications.new(
    schedule_id: schedule_id,
    visited_id: visited,
    action: 'schedule'
    )

    if notification.visitor_id == notification.visited_id
    notification.checked = true
    end
    notification.save if notification.valid?
    

  end




end
