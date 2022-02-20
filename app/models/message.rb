class Message < ApplicationRecord
  # validates :content, presence: true


  mount_uploader :image_name, ImageUploader

  belongs_to :room
  belongs_to :user

  has_many :notifications, dependent: :destroy

  def create_notification_message!(current_user, visited,room_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    # temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ",
    # current_user.id, visited, room_id, 'message'])
    # if temp.blank?
    notification = current_user.active_notifications.new(
    room_id: room_id,
    visited_id: visited,
    action: 'message'
    )

    if notification.visitor_id == notification.visited_id
    notification.checked = true
    end
    notification.save if notification.valid?
    

  end


end
