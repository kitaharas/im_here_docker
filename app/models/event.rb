class Event < ApplicationRecord
  has_many :event_ganre_relations
  has_many :ganres, through: :event_ganre_relations
end
