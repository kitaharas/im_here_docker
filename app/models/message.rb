class Message < ApplicationRecord
  # validates :content, presence: true


  mount_uploader :image_name, ImageUploader

  belongs_to :room
  belongs_to :user

end
