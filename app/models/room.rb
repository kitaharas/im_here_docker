class Room < ApplicationRecord
  


  has_many :messages
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :to_user, class_name: "User", foreign_key: "to_user_id"

  has_many :notifications, dependent: :destroy

end
