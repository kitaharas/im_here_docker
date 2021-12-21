class EventGanreRelation < ApplicationRecord
  belongs_to :event
  belongs_to :ganre
end
