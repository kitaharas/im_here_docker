class Ganre < ApplicationRecord
  has_many :event_ganre_relations
  has_many :events, through: :event_ganre_relations
end
