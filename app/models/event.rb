class Event < ApplicationRecord
  belongs_to :genre
  belongs_to :feel, optional: true
  belongs_to :user, class_name: "User", foreign_key: "user_id"

  mount_uploader :event_image_name, ImageUploader

  def self.search(search)
    return Event.all unless search
    Event.where(['content LIKE ? OR event_title LIKE ?' , "%#{search}%", "%#{search}%"])

  end


end
