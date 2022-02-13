class Room < ApplicationRecord
  
  
  # has_many :room_users
  # has_many :users, through: :room_users,  dependent: :destroy

  # has_many :messages, dependent: :destroy

  has_many :messages
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :to_user, class_name: "User", foreign_key: "to_user_id"

end
