class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true ,length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true ,length: { maximum: 100 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :comment,{length: {maximum: 255}}

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  mount_uploader :image_name, ImageUploader

  has_many :events, class_name: "Event"

  has_many :schedules, dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


  has_many :rooms
  has_many :messages

  # フォローした時の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # フォローを外す時の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow',
      )
      notification.save if notification.valid?
    end
  end

  # def create_notification_message!(current_user)
  
  #   notification = current_user.active_notifications.new(
  #     visited_id: id,
  #     action: 'message',
  #   )
  #     notification.save if notification.valid?

  # end


end