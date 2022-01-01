class Event < ApplicationRecord
  # has_many :event_ganre_relations
  # has_many :ganres, through: :event_ganre_relations
  # validates :event_id, presence: true
  # validates :ganre_id, presence: true
  belongs_to :genre
end
